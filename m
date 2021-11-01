Return-Path: <jailhouse-dev+bncBCPMNRMB2INRB7G272FQMGQEHUPPW5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E94415C1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Nov 2021 10:03:58 +0100 (CET)
Received: by mail-oo1-xc3e.google.com with SMTP id e18-20020a4ae0d2000000b002bb7f65be0asf5419721oot.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Nov 2021 02:03:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1635757436; cv=pass;
        d=google.com; s=arc-20160816;
        b=olIfKjXHjkYvumQDvIkj5EnQlDw4szNzRj80W5ggI/mY68PkQaYBZ9gDJRhwOcXaFl
         72axjVyjBOLOIH8AnWFtOwBEX9OkVQrlazrSGHAlyYdeDpA0PGg6GTBaKhnlksNFvP6a
         0bOrNXFYBUiC0ROKAIZJzhLz3Bd71Y3z964/dq6jaUAKg0rXS5zu2zvlrHPHSOOxABB0
         QLymEIWCA3IugECH5aHitW2zUGldUyalBmyR3/F0ZhNh39t0UBENkrb26MCCqRpjifK7
         YGN1jrAddpjKFYCprjv8ibGWi5PcWlObDaGAy68+Ld8NKBHUQU8wzEhOyy2RNhSb32wp
         LjdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=sHlEPZwyKnZw1x9+Rxzwn8Pq5S/jauyB8U+4tFNyy+U=;
        b=SWJxorjYtZmhEQ8LiZPQPurQvoNozLlQAfql9ssQcID3+eXV4FK6p/5M7N+f30NunB
         avzrdg4QGIVZQwxGo8PPcWt/Y94HC56sFOOGRnMmf9MnVcPGPh6KepAjvg3LQs3Ryj/P
         cHMJQReI3wHoenXyjWD5r6dIUFv002JkXse1ssGLoQDr0mx79Y2jZASI8oI5KUD2YdiH
         euRWZfTaXUmswUtyW2G12CufiZ8kgLpyoqawug3483X8aKJ+xPFOOokQUTNLIIyz5tKw
         n2yhu2yRb8o2F2xzZTG2Jb89Nw3Q3uFG6cwZQo07/pCpaZwVkqyZC5jSbH3jMSsXXFbU
         n4Vw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=DvVHT4sQ;
       spf=pass (google.com: domain of planetbeauty61@gmail.com designates 2607:f8b0:4864:20::332 as permitted sender) smtp.mailfrom=planetbeauty61@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sHlEPZwyKnZw1x9+Rxzwn8Pq5S/jauyB8U+4tFNyy+U=;
        b=Dq+jBlNLqvCRLoSFVx4se3CNUDAbrOXHOvEkuU3A6wVeaSXnSg22bEl49nhDim7IKW
         KOK1NPvY+DjEwHulRl8i5eaAd/dccS8B38K4wTzVSPGx+yoAy5cnsDHXx5Yd7tUgE2Ml
         3XWtGnvoMbHhK9+lumGiI1f8QNvDx9YrMItgSoCGQn7lUwTjhdmNVNHiJb/welJyk/yI
         zeml4vXuR+WFJmcJjlrIqrpsxOPrVxZyeLwcchEiF2RS+B7gmKuRH1m7HxEgcEWYrZ7S
         uFBJv0XuBz2/wID2ArueC+NXtHIfC7XU6fh3WuMTwz1gyafnYTfsA8yRzDjiU5IvFz8q
         2DVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sHlEPZwyKnZw1x9+Rxzwn8Pq5S/jauyB8U+4tFNyy+U=;
        b=h8srUprQSFgCS5LlYtWeb8AwdV7CDnfGmQfJ375x/VjwXALhnEzt5irsLBh0ed8M8M
         2YBRY213h0Ooi44DqEBSwCRqupSVv/mpHWf/geL+0rn7ABSUoEYMyBchGFx77Ol0TOy4
         MJk2D+qtvIVkXoiYIBVKUKUjc8aNqLmQLJzTAJWyDtPpGGSpJwwIiF087xwRHuLajuJK
         stHIPwYZNlCGGsujxwWlyPDn8loTYg+AyB7XnndXyCb+GjmQINKNg+4f+7QbanCbLTdO
         bA2JoJOHJ65WY5VLTB3WeDm0VFRnSScXfeB0C2G2OXa5fIj6x0CMJ39r3fYSFQAAfCyF
         GneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:reply-to:from:date
         :message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sHlEPZwyKnZw1x9+Rxzwn8Pq5S/jauyB8U+4tFNyy+U=;
        b=suuUu6aOP4Ty8YdiqY+xVfj9Agh0gOClpYk2XGzHRkld1oY73tpxvsnF05i8eP88x1
         NIK6RmSb97hyBB8UCB/pvDPhn6Zsuq9VrHBToaWxVET8qZIqCu6+I7ldtkvvXTxYgSiW
         QWslTRpNrCIRwq+6lcUPodbOMuToXtPpzhfFJ4gHz+6I4yFpmYiA5pFEFii9hVD3YLTB
         qB+jSE88n0hI6Rwbv3Ul/9M7vGjyxUG+w13RfouMIi6yFs3GOEDP2qB6+U2muzOJc1HE
         aH4VN7MelxHAHm3+lP/d2aAi9SY7fUc8TQGnvQICEj9hcn661RlJyXbU8kySa5ajB4Yu
         gwxA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533rqEKVPiJI47oC6I/hfdqEsBKdR4cZuKoM5HtxpVoCrPSJ8PLz
	q8ldTRYERL0FqFE85DB/hIc=
X-Google-Smtp-Source: ABdhPJx/6dOK/qkRFnquR8x3fdgxy9qRqhEh2wWh7UFFi+1t+Zo6VDZReQWArCPATelKTxBpc1Y0Rw==
X-Received: by 2002:a9d:220c:: with SMTP id o12mr20229724ota.250.1635757436591;
        Mon, 01 Nov 2021 02:03:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:341:: with SMTP id 59ls713251otv.9.gmail; Mon, 01 Nov
 2021 02:03:56 -0700 (PDT)
X-Received: by 2002:a05:6830:310c:: with SMTP id b12mr6685617ots.14.1635757436138;
        Mon, 01 Nov 2021 02:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635757436; cv=none;
        d=google.com; s=arc-20160816;
        b=cGgGURyUdvA2w0hMKGagxaysrDfiJu8Rms1qDLlH8rEKUqmcYvR63nRYkzArC/ZuGj
         Wi5XpDzF+kyltn0tf9/IdTVpOu0SGrPlkMvl0r52Qt7jGESspkQOFQIP8Y5Ppj9b/7Vn
         cC1lwsyS1o5Q+VmYOCNyVVQSP3QnSbhxb4sBQ4RA7wTZXR71PaSrpNF6OFgvh0aQtesR
         gTEO9VdrjtUPMyPnoj6NCFaUdsdIWFoxA2P3z/37pQAy1/wfLxoopLoE9bM7zQEdC17A
         ci4VfUEhAYoVj2fIioDyUFtOD6QFfrudDgCsvwwslVtLe2XJCOT+/EPfbyPflHe0/U1X
         Y/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=E2mmv+DvZ5O0LPq84pKhjfQ0wv+3JTi0htU9mD6UUdw=;
        b=EOv2eTJQT+4KlegwRni3AUW6EB5EDGDOMY7r/jVqhGvQlHzThda9xKfkA8Xxtt9WjY
         Sz9SBTJ27fwpFo9viA3SVg7GOQ6qXFu1swmTnuJbZl2L8Vdlgdi04s0VxAhkXNAxHXC8
         eUOO+T2Jw2K7ueZMP21ZcPLEpviHBUHL+YDLYmx8xBXn/ndrEv5dzaV96Pf+SuyC5qe/
         zaDd7Ru2rW9t0sNdcX6wRmEc6QZ87LgJTTeoIbJKQ6YSzcgmK2mt/0WzKwv0CVJ5+z6E
         RXH+exRSOd3xueuDhQETWFHmGycEe3+uEGqX/k46O0LynnWDJfjAKTPmaRGPD8NKagKp
         38vw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=DvVHT4sQ;
       spf=pass (google.com: domain of planetbeauty61@gmail.com designates 2607:f8b0:4864:20::332 as permitted sender) smtp.mailfrom=planetbeauty61@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com. [2607:f8b0:4864:20::332])
        by gmr-mx.google.com with ESMTPS id e1si648617oow.0.2021.11.01.02.03.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 02:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of planetbeauty61@gmail.com designates 2607:f8b0:4864:20::332 as permitted sender) client-ip=2607:f8b0:4864:20::332;
Received: by mail-ot1-x332.google.com with SMTP id n13-20020a9d710d000000b005558709b70fso17945155otj.10
        for <jailhouse-dev@googlegroups.com>; Mon, 01 Nov 2021 02:03:56 -0700 (PDT)
X-Received: by 2002:a05:6830:1b65:: with SMTP id d5mr4712557ote.151.1635757435830;
 Mon, 01 Nov 2021 02:03:55 -0700 (PDT)
MIME-Version: 1.0
Reply-To: greytownfl@gmail.com
From: Loan offer apply now <planetbeauty61@gmail.com>
Date: Mon, 1 Nov 2021 10:03:33 +0100
Message-ID: <CAENwAooiYbrjy-1XXFhytS1ahkJL-mDY5S0OmpEP0QMUY5qk7w@mail.gmail.com>
Subject: Re: Reply
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000e6c4cf05cfb6744f"
X-Original-Sender: planetbeauty61@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=DvVHT4sQ;       spf=pass
 (google.com: domain of planetbeauty61@gmail.com designates
 2607:f8b0:4864:20::332 as permitted sender) smtp.mailfrom=planetbeauty61@gmail.com;
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

--000000000000e6c4cf05cfb6744f
Content-Type: text/plain; charset="UTF-8"

*Dear Sir/Madam,*

*We provide loans to companies and individuals*
*with a 3 years moratorium.*

*Kindly reply for more details.*

*Warm regards.*
*Mr. Magnus Bengt.*

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAENwAooiYbrjy-1XXFhytS1ahkJL-mDY5S0OmpEP0QMUY5qk7w%40mail.gmail.com.

--000000000000e6c4cf05cfb6744f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><b><i>Dear=
 Sir/Madam,</i></b></div><div><b><i><br></i></b></div><div><b><i>We provide=
 loans to companies and individuals</i></b></div><div><b><i>with a 3 years =
moratorium.</i></b></div><div><b><i>=C2=A0=C2=A0</i></b></div><div><b><i>Ki=
ndly reply for more details.</i></b></div><div><b><i><br></i></b></div><div=
><b><i>Warm regards.</i></b></div><div><b><i>Mr. Magnus Bengt.</i></b></div=
></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAENwAooiYbrjy-1XXFhytS1ahkJL-mDY5S0OmpEP0QMUY5qk7=
w%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAENwAooiYbrjy-1XXFhytS1ahkJL-mDY5S0OmpEP0Q=
MUY5qk7w%40mail.gmail.com</a>.<br />

--000000000000e6c4cf05cfb6744f--
