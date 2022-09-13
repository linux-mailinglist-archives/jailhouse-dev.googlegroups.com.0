Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBZ4JQOMQMGQEFAAMJAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1139.google.com (mail-yw1-x1139.google.com [IPv6:2607:f8b0:4864:20::1139])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F1E5B78EB
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Sep 2022 19:59:05 +0200 (CEST)
Received: by mail-yw1-x1139.google.com with SMTP id 00721157ae682-3452b545544sf108158967b3.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Sep 2022 10:59:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663091944; cv=pass;
        d=google.com; s=arc-20160816;
        b=FRJ154nMhO4/pEoWaO28BJftm9RCSS50wDnHjeQkZ7eZlROHQcM2hET3NRnTs7W9rT
         OPnApTIwCzuBSWemC4G16KinDg7J9tgBB2dA6vvYxvtEZekARFOiwhS4dZ9glsfzeJsS
         4Jzn0Cflxs9PYG3Yn6bbFo+1RZWXAT16vDZ0vUOERNYouDbMkL6TFqpTdaAUgkzcdUmb
         XXzbLrfVi1Nr+voACZ1s7uHqlPX6gmbeJW0u4r297ckBBAQ3VoQrJe+xJ0UC8wj609pb
         oKoagdArSQZQIxAwlIINIlk760OkURsUFnIet+SowKnNuBYO7aUV2Y6ROdmvFsvG/0Wp
         2lSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=5NPlGFOj07oVrnkcy1hX2YIXrAd0AUie/wdBxd/zLZ4=;
        b=zPJt494caGeRbJ8yfH6Vqi3HCMR/r7hy6U3iom0b3hBesOFikL8AXj4LbefWlJHIt/
         kS1WJsp5uav3VDeyr9Y0jz80sbfKTQDaKk3w9R2PWIULFVvX7yrRrX0vc/pN8KToFTyO
         ecQM/995oDzO49gV5//j2eLxyAaCKR3ZDTQCDVTdPsRowGocVqdJqF726/swIrYkUu0a
         ia2EHH3zJKucxn0l1T2/4jCHqWYwwLBq3x3tAxQVfTpPBcS8E9XYVqFaH6N3H3+gqLs2
         UpPx7TjRZvJOL0Nl+k02dezHBMYGRUcYMJB+OlpVS4eE7M8FRLugjLtzaE+k9Oh3lLll
         dRtw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=oz8eTgtd;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date;
        bh=5NPlGFOj07oVrnkcy1hX2YIXrAd0AUie/wdBxd/zLZ4=;
        b=sFjf78E5jlhTAcJAKRFM5Gbo50Nd9Do5RQaVRro9w8tme6kBZ/ZTEQ7n8I+7aQNGS5
         pTv0yW2FWq9t/HAQGF5Fz6mtKLRIedAIkEJ55Zv2t4VF3okpxfYhoAletXWtYcRpJV+Y
         zY7CbwTd4j0FlUnVAVkpSytffjrS9FTJeSycMrVlvDa2G0CEbOvu8Lca4wn7U7G+l6Ak
         FN3G3v7ahdkRB4AlKPTO8xXB78vveuAcsQPszpauy9rNovuo2JwfJvbTmMsbahys1k4Y
         ZsFvGxKNbfWtiG9oz8LG/cCeg2DEJaQB3v7pU8GnHDftv4D2B9Iv4w74ZPFXsKblYITX
         nirg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date;
        bh=5NPlGFOj07oVrnkcy1hX2YIXrAd0AUie/wdBxd/zLZ4=;
        b=dcHy8X5nImV/XROEx/C3P1tKzYSdaLVex323xqQijh1ODcCawVuDsnTUzf2p+bKGkn
         6sM+ZwbeXwjACLo5mt3UHK1XR0/XeHr1vHBd24LAEMIKpiYgoYTuxtbR4atSIcI/9jif
         Rkfx20AbS7vLomKSVkf23WQ6x7TCbop24AyTqLQYK3QbQ1SUYJmQsH80ah7wlckmFMBI
         KRLT+fbNKIJtI14dT31K2uHKQEtKsFDsxwrMObojOPzEqSMm6WRjJPyYcbWwuW6QvS1k
         6+C5oslRmgSdXc/+76DjBr3WSmdzmkY/wGaMQZvU5X1d7WbH3hV1czOk8LrtCcJrK0+J
         R4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=5NPlGFOj07oVrnkcy1hX2YIXrAd0AUie/wdBxd/zLZ4=;
        b=qQNL1DEQyqdfNuzy5zRD+YvbxarexD91E7i8eycTy781zWaAFEJmkU+o4ZR8r88Pb3
         LMtmbD209T6iYhGm4zHN3ePIPUFWg+gt3dA1ApGTMJByLoGpvRfozVN+ZMH1bEXL0sqt
         EnfdjL6SYi85YtQ/fH9NftvdZ3eaMoZcXX38WuCS0FpODfIv21zky8gXaATcctXNiZbn
         0hImZViax/78EjLuWZYtAUBCmBTclPWe0jOZKpUiz6eu1n6Ti0SpEPJHkw328uVz9LXt
         dzl6jwry+m0ZI7qqrufZjefhQaXaStrHDHCOvgxd5nWtCU/mRWdjGnFR/teK9dXvr+ru
         0X4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo1AHUOWIKDSt9FqC2WFC63NtytTI/GbPaYkoHyu4t77SnXefHcB
	1xG+xNtgoQ1iwU6CU7vUBWc=
X-Google-Smtp-Source: AA6agR7lKkJmRB8DGZqwyYnJP6vuAtoqV5aUA4IJSMO6kbxUieUAJ/t0xsAkQ0VZAr6NziP+KWa3tg==
X-Received: by 2002:a25:81cf:0:b0:6a9:4d0d:5ee6 with SMTP id n15-20020a2581cf000000b006a94d0d5ee6mr27695385ybm.153.1663091943776;
        Tue, 13 Sep 2022 10:59:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:c513:0:b0:6a8:d340:6ce with SMTP id v19-20020a25c513000000b006a8d34006cels4910888ybe.1.-pod-prod-gmail;
 Tue, 13 Sep 2022 10:59:02 -0700 (PDT)
X-Received: by 2002:a25:e0c4:0:b0:6a8:d8f0:5485 with SMTP id x187-20020a25e0c4000000b006a8d8f05485mr25065796ybg.387.1663091942838;
        Tue, 13 Sep 2022 10:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663091942; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9YqmmD1ULQAhZnUsHM3DdKKDhbNfmIb1J92uDPIGBuRLQjKj6ZtExEcKjsGtHMY9G
         j7Qrm3JS28Esmkv0SlM+Vyhyi3rK5ju5TmC43/Q5Uph65a4p0KegVbPOAika8+Uk2Z1j
         xi48Hs4BcsemdyJ5C4kdgdxFv5nMkxobB35uJplf4lrdyOFv65UFdrrbqyTi/eP9xLip
         SIWqV0BHmNZTWf7XFXUb/uge2sNZ2+/y91UmQr9mVgNphugxN9RGlcb9iHd4AvzFzxak
         OsbwkTwvLEygBKErrViPk2QD73NOuqqg971u9jFhqg+VxvAfVrBjr0DXwloESrnBSmSy
         +8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2Mb8VsFczXvCWq22Pd/3l0Ufuabr3Z0wy199TqDsQ3w=;
        b=wOgUF1d3AAUB7Z87ZaPZAtHTySTqrnZZJS5yme9WeA2BlghjSEzFl5gockSc23lbY0
         nASgSvwWXuDwN48cNnMZ98pm8l3/ARgBfs6M39DEmeelwX32zzGoUrpJJnAU3TodK6/A
         K4PII63oIN7xH0Kn01tEYp3keudyVIxQRzLVP2hKcmUMvji18UX8nOw72a4hVVAhQJVR
         cxHzFP0IFgwW1TwmJrvBCm38dDBUuJTltcayRv+ByfW9VLtyXiDw8oMTssltSZUMsHdK
         aeJp+0M1ddjHNQfSlPqMpHaLqeRtJ/EBRnWfDOdoM/JVodI/e9oyKp7rKtECea0a7PdZ
         y05w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=oz8eTgtd;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com. [2607:f8b0:4864:20::1132])
        by gmr-mx.google.com with ESMTPS id k127-20020a25c685000000b006aea4e47938si881515ybf.1.2022.09.13.10.59.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 10:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) client-ip=2607:f8b0:4864:20::1132;
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-3450a7358baso149675807b3.13
        for <jailhouse-dev@googlegroups.com>; Tue, 13 Sep 2022 10:59:02 -0700 (PDT)
X-Received: by 2002:a0d:fcc3:0:b0:341:5d51:3fcc with SMTP id
 m186-20020a0dfcc3000000b003415d513fccmr27655015ywf.340.1663091942558; Tue, 13
 Sep 2022 10:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <94bae287-eaf2-4ae2-bcdd-fc87342256e5n@googlegroups.com>
 <CA+V-a8uE2PzOF2mh0xEQmQ=akMTWXHy7usqEaM1C754DHS1=+w@mail.gmail.com>
 <CA+V-a8uJVDLNGjtcoZHN_FcvVMnxq5MjQRudtR1zQznPja2Kng@mail.gmail.com>
 <CA+V-a8uoYz_CUxxstk8afHMKjOjHX9c=tWPAhFpoBKjfnb=TPA@mail.gmail.com> <22820838-b99f-4a2e-9c87-d634c7d376e5n@googlegroups.com>
In-Reply-To: <22820838-b99f-4a2e-9c87-d634c7d376e5n@googlegroups.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 Sep 2022 18:58:35 +0100
Message-ID: <CA+V-a8uHOA4PBjYuiEAY0pzAy1w_nps7rH2RcJB8pkUoxaUXmA@mail.gmail.com>
Subject: Re: Linux imate unhandled read
To: Yelena Konyukh <ykonyukh@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=oz8eTgtd;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

On Mon, Sep 5, 2022 at 11:26 AM Yelena Konyukh <ykonyukh@gmail.com> wrote:
>
> Hi Prabhakar,
>
> Just wanted to say "thank you" for sharing your experience  - your messages have been helping me to get non-root Linux cell configuration.
>
Glad that helped!

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uHOA4PBjYuiEAY0pzAy1w_nps7rH2RcJB8pkUoxaUXmA%40mail.gmail.com.
