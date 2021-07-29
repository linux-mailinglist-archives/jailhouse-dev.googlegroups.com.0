Return-Path: <jailhouse-dev+bncBCWNNPXXXAHBB5O3RKEAMGQEEXPHJ4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf40.google.com (mail-qv1-xf40.google.com [IPv6:2607:f8b0:4864:20::f40])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A4A3DA463
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Jul 2021 15:32:39 +0200 (CEST)
Received: by mail-qv1-xf40.google.com with SMTP id v15-20020a0ccd8f0000b0290335f005a486sf3881906qvm.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Jul 2021 06:32:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627565558; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z4JeRgcqFCcdfJ+V4SRXaz3OsXrPCwrxBEK0wJQ1RcUWTMau7Unh6uChmq6ocJPe+K
         L6wbNvvONFmw4gIM3n0hx3PYS4JiJP5hqz7O093+1R+xu4qJUiujA0QpIEVozRfYc/NA
         xwnCQwKvofYpV3VnO8VBVsz/V9aVcJty/qBOm2Xm4/v5PNT01qTbBDOub/0p85Kl8RRK
         U/4t+B43zXmolEjcFkP2GlD5Fa0Oo1Cuq5f2FzKCR0f/aEOaEybAeoweqjl8pA085Ck+
         04WOzwHzLLRv2A9z/Xxl84vDH9fAy75S9D63N/yZ+T0Axl5BANgih9HUQFpRwufLkOuQ
         acBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=93RVSwBgpL7NUAmDYphuLMO8RNN5+Ces1n3ID7d1UHw=;
        b=SODgzhpzyHEyR8Sqxzb8drlrbQwwQXDIwrDmMECSuXMS1sHKCug4bfEnCF3T313f3u
         6IZF5JW7A6k16KFrwqWZtjTQnqIkE1QjiJPbnA1eZcvCF0W5ZgCyEiLtrtPZIAzueeer
         xb04qzmqxfxSGNOyM+UQ/CGlKKMI656JyyPtUoz04kTn7gL2BW8qydHxQ3pB5feE+HMz
         FUflLRi94KcXWyhol7q0x8zKVhS74TwOGupHICqaw8nS/1nRwFPy7hi5jfiCMFx4hNet
         UXZHz3uyQ0bS3r5o5PixtCj9XzIe6i/KEAlzeQjghRxxsBdcF4sONDeN9LN+NdrBXgWu
         wZQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cuEWVDoz;
       spf=pass (google.com: domain of cynsanchez.00225@gmail.com designates 2607:f8b0:4864:20::b2a as permitted sender) smtp.mailfrom=cynsanchez.00225@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=93RVSwBgpL7NUAmDYphuLMO8RNN5+Ces1n3ID7d1UHw=;
        b=KQmS795J4xyDX9BeoQgqDcHHVxDcpCjWey2jDWJGc9gYFMKGxISRzCkChN6APFD5Nk
         1bTT2g325vjUA4NuxiqtE3X63X2dvOjsrH2G1G2IawVWvfRYDWbfM+gBoLtBDG10tCkX
         SXrGFvazsWmgwc4YrOcq/dKwtw7C7MnZBdjoBmfTg1FyIgWMH/qXZtz5sdHPT+/2O6vK
         Z+nZkMsSvR9AtCaNs4aQnpaZ/OSfg3oz4kJIg3nKa/bf06IgCEJ8hqEgEbYcNe1kBzk6
         Wy8nxcrkvMhHztPKFVlxZrzxP90obCOdNlbeyBTtdzu5fkTqX1D9tB4eYFoRLFf0n5zs
         L+iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=93RVSwBgpL7NUAmDYphuLMO8RNN5+Ces1n3ID7d1UHw=;
        b=rZ6OqnRcnOJJQFnXcfjGKKxeHTvGiK0N0o5xQ7iHK/h1L7BuqpdGcKuaFPBqzHRwnW
         1PDMXZQtAY1Re3B1x2JMUP969gkLRL7FCUrn0LuKwlCVwXO/GwGEN5/pkBXWveFL/H+I
         wnkw4LA2mI/LL4ZaMePJESIOZwWtwQS29R3+9j35thtVwAB4I6WZpR2niN5biBmJ+SNc
         RQHJrDl3ahffl8Lg+8awyMsAn/SJGshOIjJRpPlhn7UzX+a0m9dkF70DAWmvTDAvOXmv
         LoeL3Ay5RqwfOHlCq7x6gIPca5sMoU65qgEqVMqSuVhVb4DQicqCdY5uvocV4Vo2ju3p
         4uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=93RVSwBgpL7NUAmDYphuLMO8RNN5+Ces1n3ID7d1UHw=;
        b=ttUDmGLsigbMW6XyyWjzj6eSfhgXKuwjL4XlTffmkKPeVFZzXsN0GqQRjJsWDcA80x
         4U+rQa74W8Zx+9hWTEEwWpCPGQvO0FdTg2btJcbGSZubl54bx2SklLduNFv/R+s/8vYf
         5qaOvsnTMDSbBcilTcMA2DMC5Msf+csK/I3CVPb6O1yCr6ctoNnQcfsnCs4PZx009UNB
         UXpFShu+bDRROHBOOxNFdtnESHqbkuPcVV/kJUD6McwvSDINaHqSm+Ew/iBWOXszoOUX
         P2dQbjQVYQKqBlTNqp0CVxX154NR8eq7gWU25YqznyW3fzzMYGTwjbSFgdOk2O5bjl0N
         fZGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530WwAAJuckPjWg925rFLCiuCyJaHhCbVlaR0MCscMY9xKalPPHW
	WHj7jVDa1CXr21XUTiuf8cA=
X-Google-Smtp-Source: ABdhPJxtH3b9CwFSHsMGGq2vClRHhb1oL7q81FMr/vlPQGsYj7H1lkIglRGJKry9gBhWRQUKv0YTOQ==
X-Received: by 2002:a05:620a:62d:: with SMTP id 13mr5190307qkv.18.1627565557786;
        Thu, 29 Jul 2021 06:32:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:aa8d:: with SMTP id t135ls3366886qke.0.gmail; Thu, 29
 Jul 2021 06:32:37 -0700 (PDT)
X-Received: by 2002:a05:620a:448c:: with SMTP id x12mr5249594qkp.39.1627565556941;
        Thu, 29 Jul 2021 06:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627565556; cv=none;
        d=google.com; s=arc-20160816;
        b=JC8p8eIKrgdVDz8+BpCGWDXvx7tFqvkmXC82SIYoRk5b96PywhWtRTzDoAn+OU/Q7j
         yaBOXSba40QRLbOoGD4yuf5FdKw9+6D6Q8rdCePefh2hmHbK6Gex7zSPihCzgr+Dcxfu
         lcb/jWpknbDYn35NycUfwHt99aVn/wqQflD7zyTAW8oYBZ53CldrdtX4ZJnYXv2us1v5
         n2EEZ6Lp6nk8C28VbxB5S0gR/veMVVIOcUXr89uuBa57D7aVl/f3p7jBdV42VPrLzPDa
         kj9Qv5gDZJGMxU+h4OaOnDgKOA1ONzzRm0I/AO4f/C1W+pnUi28Ns5YzkUg2XTl8JgVD
         SfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=X6bK2vm9eQOcv0QKwBhdov6Aeq48r4CbNf+RhHAHjXQ=;
        b=oUvCWuxAwxmt2Gou3Lj73pcYcqZInqQx36iYeYqMm1LDp9Md3kNyZEYgTURX/o14FY
         80rAssoN2JDH4hVx3EXXec21nbvHIR0IRiM1vRMMZKVoRC8dgesC+j4zXHCAieL7FdsQ
         hAVE4V8yyaYDH0778+5dxrVpvVUcDpMU9F+Euxyj8L3q57dt8gmQn5dCHHoVB34Bnxym
         HBV8kgt6KJsuYggIcX0oiGZGqehWS60uJSmX7+mXaXcEF/BXqAOWEiNDM0HJ8eGn6hs2
         rTKOx9bAFfkkvEkigv9EtR3v9Mo6v1A30IXOVpxuNIXdsxs/eRV4JWAmX5pcgJ15Davc
         QuJg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cuEWVDoz;
       spf=pass (google.com: domain of cynsanchez.00225@gmail.com designates 2607:f8b0:4864:20::b2a as permitted sender) smtp.mailfrom=cynsanchez.00225@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com. [2607:f8b0:4864:20::b2a])
        by gmr-mx.google.com with ESMTPS id bi21si138789qkb.3.2021.07.29.06.32.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 06:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of cynsanchez.00225@gmail.com designates 2607:f8b0:4864:20::b2a as permitted sender) client-ip=2607:f8b0:4864:20::b2a;
Received: by mail-yb1-xb2a.google.com with SMTP id w17so10204015ybl.11
        for <jailhouse-dev@googlegroups.com>; Thu, 29 Jul 2021 06:32:36 -0700 (PDT)
X-Received: by 2002:a25:d450:: with SMTP id m77mr6965485ybf.412.1627565556708;
 Thu, 29 Jul 2021 06:32:36 -0700 (PDT)
MIME-Version: 1.0
From: Cynthia Sanchez <cynsanchez.00225@gmail.com>
Date: Thu, 29 Jul 2021 06:32:21 -0700
Message-ID: <CA+=AnS-CcLS-jrGL0eOU5W=REfov-FzAqKQHtKkB8qJg6EnZZQ@mail.gmail.com>
Subject: Greetings in Christ,
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000db366105c84322b7"
X-Original-Sender: cynsanchez.00225@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=cuEWVDoz;       spf=pass
 (google.com: domain of cynsanchez.00225@gmail.com designates
 2607:f8b0:4864:20::b2a as permitted sender) smtp.mailfrom=cynsanchez.00225@gmail.com;
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

--000000000000db366105c84322b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings in Christ,

My name is Mrs. Cynthia Sanchez, It is the third time i am contacting you
concerning my health issue with regards to the charity work. I know that
you will be surprise of me contacting you but my health leads me to contact
you. I have been unjustly treated by my late husband families and relatives
so, I seek your help, attention and genuine co-operation to stand this
charity work and I believe that you will not let me down the trust and
confidence I am about to repose on you. I have been maltreated by this evil
family of my late husband for the past ten years.

I am writing this letter in other to inform you of a charity work that will
be benefit of you and the needy immensely as long as you will make up your
mind to co-operate accordingly but before going into details, I want you to
take note that this charity work is my last wish on earth and not something
to toy with rather it is a humanitarian work that will give you the
opportunity to save lives around the world.

My husband is dead, I have fund which i inherited from my late husband Mr.
Carlos Sanchez, The total sum =E2=82=AC16.7Million Euros which he deposited=
 in one
of the good Banks.

kindly reply me back on' ( cynthiia.sanchez@yahoo.com ).

My Regards,

Mrs. Cynthia Sanchez.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2B%3DAnS-CcLS-jrGL0eOU5W%3DREfov-FzAqKQHtKkB8qJg6EnZZQ%40m=
ail.gmail.com.

--000000000000db366105c84322b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings in Christ,<br><br>My name is Mrs. Cynthia Sanche=
z, It is the third time i am contacting you concerning my health issue with=
 regards to the charity work. I know that you will be surprise of me contac=
ting you but my health leads me to contact you. I have been unjustly treate=
d by my late husband families and relatives so, I seek your help, attention=
 and genuine co-operation to stand this charity work and I believe that you=
 will not let me down the trust and confidence I am about to repose on you.=
 I have been maltreated by this evil family of my late husband for the past=
 ten years.<br><br>I am writing this letter in other to inform you of a cha=
rity work that will be benefit of you and the needy immensely as long as yo=
u will make up your mind to co-operate accordingly but before going into de=
tails, I want you to take note that this charity work is my last wish on ea=
rth and not something to toy with rather it is a humanitarian work that wil=
l give you the opportunity to save lives around the world.<br><br>My husban=
d is dead, I have fund which i inherited from my late husband Mr. Carlos Sa=
nchez, The total sum =E2=82=AC16.7Million Euros which he deposited in one o=
f the good Banks.<br><br>kindly reply me back on&#39; ( <a href=3D"mailto:c=
ynthiia.sanchez@yahoo.com">cynthiia.sanchez@yahoo.com</a> ).<br><br>My Rega=
rds,<br><br>Mrs. Cynthia Sanchez.</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2B%3DAnS-CcLS-jrGL0eOU5W%3DREfov-FzAqKQHtKkB8qJ=
g6EnZZQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CA%2B%3DAnS-CcLS-jrGL0eOU5W%3DREfov-F=
zAqKQHtKkB8qJg6EnZZQ%40mail.gmail.com</a>.<br />

--000000000000db366105c84322b7--
