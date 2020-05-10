Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5XT372QKGQE6I4IS3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8121CCB35
	for <lists+jailhouse-dev@lfdr.de>; Sun, 10 May 2020 14:56:23 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id 37sf491609wrc.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 May 2020 05:56:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589115383; cv=pass;
        d=google.com; s=arc-20160816;
        b=UJBGLy0nQcDpigewvi0W3K16Ho1ZHWSteas3Ppogr+/AKDzO3J4CgnIFBH8B7LmGvW
         0EW+S1peHWLyeOylwkS2BiGdY7Eyk2rAdPpSQnPiawFrSlsZIK/jRKuwWSKi8L02azTG
         C20mlRJBHO0lRfFdxfH1q6qr+a2x/GSSj4LJDyQ9ZrqJfwR23Xx1X58I8/E7mcH5i6oP
         oTarRAYVUTS5vlrlAdc21o3UffuPhP0wxKGNNAC2hP3xH599/FXIiaCR4ecXdvNEil8N
         LBH1/El820JyDW5pss5EWFUy/zLDK4sR9U46QAUoI6bRLFqfh/kP4Cci9OX/vuZ2vV75
         vfjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=CYz2pMr8F83G2awJyPWgM5+L8v99u15GAwNxBnDaQhM=;
        b=q7cUEFkIJI9bE6N2KJl8NH10+DoNo1ps0dpavD6HuVu7oz/+/0TyMsrJr2SUdwKTYF
         +6/eYs+gOvAkVAiU2/VlD7F1xVNnsuIFymrGBsCN9cT8Senzbzd0du6NAAYm2UIPyq06
         mzpBHZ/dbFfaQ0wFYjqdGpM4LMcqMickaVeFRjykyrfrRLIaXOjkoqqnSMl4D8i92zV5
         4w7tl6M73O7nR0MZfLieYoGQldA9HeEIvpX27vsAaMP75ENtg2ktDEKOAVLZueAqmxom
         wwOgYtOlH9FnfsaOpsMH8UJ63K6r8xWcpHNF2Vb+iPJNaXT9m+fykPbJlCeqyc50YUgf
         wb+Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="lhymw/3Y";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CYz2pMr8F83G2awJyPWgM5+L8v99u15GAwNxBnDaQhM=;
        b=G6UJ/66CHD0jd+yQxHxq0M8xYtWhQHxf+psMkrnZtOAlbDngerOXjvoroEucxMSjPG
         Xz1OaKD4nHPxl1ocjzRDqaTYshlH7Mbe754dQPQtUCBT56uTazKYsIdrZbeHU8gogc2A
         5tqcJOgBuwXh5hWaR3aCMpjUfLjSAor/qMHr4NVB0FwWDVLTpiO1GXRMwnANkaTIBtK6
         rXEylSHq+oRcUDqIa99++LSI3aK20z/AbuPC4KTXurMH3a8C2qJ7bQ/mUQ2aQcYPm+fY
         B0TnabCyp1A0NMuzNXp+Ea3MZw8lzNRuy8lQGyzsOeSfEBHuINitYH3jFlq3vLn/T+Ty
         Li0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CYz2pMr8F83G2awJyPWgM5+L8v99u15GAwNxBnDaQhM=;
        b=AcZECfydnq8mbeH/dylgC0pmLZpof+POxsAE3VnCsMy67CIr+mRhVhx6pBxyJwXtsC
         sdjM5GxseQz07vGQLCfkcJIOvMnKQ4WYIQwrZvSCD3hXxeUFj0/hxj5BGQZLZ2CQmnM/
         oX0gFVkfgYarmkq7GJLt2auYSPR36TSj/FCacXAiSbiKBmE7tMubnH+g81OY0qt0pPQX
         39A21FZxCPanOq1emzPu0upR7th3RI2qoBDd9ZzcgyXfkDYiQg3pS9gZOcQHgCzYqWcz
         8blbevDsf3p4EwbcOuLn1Bk3IGT7O16R0q9Zw8DX+lNLSWQIKQtDqaSpOVk/+p7fs2au
         hfvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZ2sSH92CBDTQlUgH/xjma6wjdqPJ8d02MUaK+dvYRHNlPLmoOL
	po6LCfL/RHGCmkEVmBbT1Xs=
X-Google-Smtp-Source: APiQypJWu9T6vFjq1vanrW+93aA8WQrv4KNfKpVd6DizZ8wWKyCZGyxvk0VTdRJXZjykbkFUuD74+g==
X-Received: by 2002:a1c:7212:: with SMTP id n18mr27625396wmc.53.1589115383059;
        Sun, 10 May 2020 05:56:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7ec2:: with SMTP id z185ls23929742wmc.1.canary-gmail;
 Sun, 10 May 2020 05:56:22 -0700 (PDT)
X-Received: by 2002:a1c:9ad1:: with SMTP id c200mr3582089wme.147.1589115382460;
        Sun, 10 May 2020 05:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589115382; cv=none;
        d=google.com; s=arc-20160816;
        b=qLdicmrF/demDgGsq7EeXHP5Rx5tlQFMQKbu5eOKvglxkxo3doxzoel6/pixMr0AIA
         /X8bHyP2TZ64zpKiFdFOcxTM3Nwu8drSCNFlN1Fs+gS1+5L9zSfSR0M6Ehd+zVxEXOGh
         NxoLUNr/OSf1JPe/+m/wjaaETphQUBgD5bPcD+PuFH3+Nx9DJhnU0GM2cG8obFM36gN0
         /AHIvnKqESCnxSIKEm1d8Aeu1IX/khyR1Zs5HI8IeYFaSdO6c/7bfii7+OHKCPZIFkeb
         Y4y4WlGyiwvstwt/ZXE3eEac+xbgQIbghwAOlOcJXCHPjBWlD58Csb/+LN3jyYS1siah
         RCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=SdFdfwVD5j9hTio/ZKWfOJxoAOgB5oBN0n5SbBC8VlU=;
        b=y7xCDJI1lLWIkB3w8zsfUDOgdqzDIxhuBqEEtRTNKmvGVD8tSZavOyC/DA7p3W0JkO
         IOqDfjWTWCBDjZI72ICBORpJ2YaJor8rmRuPUT3hP1Cz+3KaYu51fS2g6ozLR0p/beeN
         8jEk7Ari/GRUJskkqD5vo0vDH9jVQIwcQTBJ/p39yJx+tbAQdWFl273jGh0ljtkLaPCY
         YvaC9tNaoesDZDYLAGRDznR5HaksyYRmrAAHQByAI1sRenw8yL89fg9YX04lYHFMIxXP
         fx3K9AFG6OLj3owOvwE2lGS6NIg7/aZ0aQSXLg6OQL+G3/186NO5oB5Kj0UMRclx0G/x
         hRAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="lhymw/3Y";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id q17si995119wmg.1.2020.05.10.05.56.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 May 2020 05:56:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N79N8-1j3nuT10Oq-017SAs; Sun, 10
 May 2020 14:56:21 +0200
Subject: Re: Problem with setup on Banana Pi BPI-M1 ARM board - jailhouse
 enable bananapi.cell crash
To: Luigi De Simone <luigi.desimone3@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <e5934ccb-97ba-49f5-bf43-d47b2763f4b4@googlegroups.com>
 <fc9db7b7-1804-d4ef-e37d-d5d8198c8278@web.de>
 <db06189c-4bfc-4559-8052-9782f06d94e3@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <140e3a12-1921-6116-9af0-1c6eaf1b116e@web.de>
Date: Sun, 10 May 2020 14:56:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <db06189c-4bfc-4559-8052-9782f06d94e3@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4GZ9b34Gpgr08CG8j49jmeisZV9hXWgRpbLzjV0wqb1l1DWRKD4
 hPywfl/jm4S46UVXx6c0WV5kF9qGet9ZF8n66aj1zg1D7WuO1CE7qE/fX3mJUaYPuBWrZ66
 QuTnpCSwQUm20qVR7XGKiU7f3BqAOzw330hq1OoVxUup6OOLl/NJrYZPWvQS14raaPngZ3D
 Hz4F6h0xcqru3LKAjiPrg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b3pqkKd4mWI=:mS5mZkpIkGuFca4wIOLN+H
 4Z4GFswFeu7Cyx7qsVluxkk4YpF/v/ujFAgt9xHcKxazqus987XDPhkMufiqGFpyT7+h0RM6W
 PjqlySn06ZX/TP17I+OgxX1jhBfZy/e0PzMRDOD+3BNFuWtA95AwXgnQjoxAPGZz2HlmpwMll
 FmOhi8fs+72R9Lfgr7fAHyq5snCMyqL8hN2pozGTE2PAzwgJLtm9Ogp/A5z0dyFNw/j4a5V8f
 3LlZTUYA/1hc7XZyGans/K01zktjYYiZjqmx8XWXXfpGVWfPs136ScagA2nREchhCCXL8UI23
 dX5EkR0XWJ8BZyJ3OG1Kp3NB+Up+YqNB85IYTIgkVSOU3qnKmCGOFPU0l4Ub0dSqFF17OeKWa
 OZonTbijOyzsLq/JUC+t0M8vIEQmREHpjAcWsws0IRujU0ZJex+03xqRWFU9STRViJwxSso1l
 l3zDNNhT4cePiKU6ZQkfadVX4EGUn/DdxM6eRJ9MZTHnGVS0yUcUjSuZ5yxViHhLXHxPvpk31
 XipLVfLQxBteR3DPY5A4ykUnaVoF99YfQVM181mqfIciqP9CQUYd5KcMzX5O6x2uev3pUBX8I
 MJ0ePr8ioG6J7L9gD0M0NaYomdO285ewmss/UfWc3prATDKG1y1obUsS8rfwEaeuJp18Vpvyn
 B+UAD+pEYPNdpDb5JAg0wCeLagt1ASMDS977rcU3ptUtQY186xzI/ec8LLKZo3YAJ/CcxEe8L
 0GgKnBkj+vrpvrgZ/7wcHv5irmrxDMrVkCCa/e1wDtYgpGjPnfrzaIAAxfCoew4E7P6ka6zkK
 RnX+8cf/J1ITEhhcOYpWjOI61uSLr/Mt71TRAgvTwH6y8+cUzJgwzGPRYn88BdqYSrSgEyOvx
 17d8JWMywOzIvwljP9JTDqRQd9oDd+2x0lKNkPUh3Z1j2TtwthS1Pc/51r68UX4c0BAVzcshA
 JLPQ/2OIJOD/CrFKEw9fAOXOqGw0IbH/yE/5bLjxv3uP49nUCYtZAOJ9W8fd3vKFzXh5G6eTy
 jpE+/jKLEOcTQDksJwQhXGXxuOklyP0iAzdqFNRD8gA7L+Mvjsg5pkvRwJ7Qn6ARTkjgw3F88
 fFoi6tSj9Fh1+n3NHGttHav9tVf+g8Tg3woTbbSsoto74hm1+kKwEjrhZJR47ZCWZj0q7EcWy
 BZxIjdmgfZ2iSSnwfbKUl5uN9ISjBnpK5hmYyeq7faqG+IXvN0WghBcPSLPsuwC/D7U4BoUja
 ZruTtNDQzFvn1syDI
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="lhymw/3Y";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 09.05.20 20:59, Luigi De Simone wrote:
> Thanks Jan for your time.
> I've tried to go back to v0.9 Jailhouse and FreeRTOS cell commit
> effb194d911971c6065e37bfeb8d49b12d4dd212 (more or less the same date of
> Jailhouse)
> The kernel version is still 4.3.3
> Run these commands:
>
> |
> root@banana1 ~# jailhouse enable jailhouse/configs/arm/bananapi.cell
> root@banana1 ~# jailhouse cell create
> jailhouse/configs/arm/bananapi-freertos-demo.cell
> |
>
> The output:
>
> |
> InitializingJailhousehypervisor v0.9(0-g1e780089-dirty)on CPU 0
> Codelocation:0xf0000040
> Pagepool usage after early setup:mem 54/16359,remap 32/131072
> Initializingprocessors:
>  =C2=A0CPU 0...OK
>  =C2=A0CPU 1...OK
> Initializingunit:irqchip
> Initializingunit:PCI
> AddingvirtualPCI device 00:00.0to cell "Banana-Pi"
> Pagepool usage after late setup:mem 57/16359,remap 37/131072
> Activatinghypervisor
> [36.540575]TheJailhouseisopening.
> [44.652929]CPU1:shutdown
> Createdcell "FreeRTOS"
> Pagepool usage after cell creation:mem 65/16359,remap 37/131072
> [44.664523]CreatedJailhousecell "FreeRTOS"
> Unhandleddata read at 0x1c2090c(4)

That's a GPIO port range (see config), probably taken from the root cell
when the non-root one is created. We do the same on the OrangePi Zero,
so it's likely an issue of your root Linux setup. Again, this works with
the OrangePi Zero setup in jailhouse-images and could serve as a baseline.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/140e3a12-1921-6116-9af0-1c6eaf1b116e%40web.de.
