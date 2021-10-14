(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)

{%dependencies.inc}

{---put your middleware-related dependencies registration here---}

container.add('session.manager', TJsonFileSessionManagerFactory.create());
container.add(
    'session.middleware',
    TSessionMiddlewareFactory.create(
        container['session.manager'] as ISessionManager
    )
);
(container['appMiddlewares'] as IMiddlewareList).add(container['session.middleware'] as IMiddleware);