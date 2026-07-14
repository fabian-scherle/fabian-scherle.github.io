import { logEvent } from "@firebase/analytics";
import { firebaseAnalytics } from "../config/firebase";

export const logFirebaseAnalyticsEvent = (eventName: string) => {
  // Analytics is unavailable during the build-time prerender (no browser).
  if (!firebaseAnalytics) return;
  logEvent(firebaseAnalytics, eventName);
};
