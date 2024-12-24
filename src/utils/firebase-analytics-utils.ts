import { logEvent } from "firebase/analytics";
import { firebaseAnalytics } from "../config/firebase";

export const logFirebaseAnalyticsEvent = (eventName: string) => {
    logEvent(firebaseAnalytics, eventName);
}