Return-Path: <jailhouse-dev+bncBC653PXTYYERBHMTTCEQMGQEDFO2V5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3c.google.com (mail-qv1-xf3c.google.com [IPv6:2607:f8b0:4864:20::f3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2833F7180
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 11:13:02 +0200 (CEST)
Received: by mail-qv1-xf3c.google.com with SMTP id e17-20020a0562141511b029034f8146604fsf17049835qvy.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 02:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0ocr9aK+b9r6Rtz3bWlgVWUngF2/3ZKqSJHdKZbdikA=;
        b=OzbSju6S0a/47TdE0yKr0JsQQchTVtQFq2U8Vj8HVEWUc/jWCvzjBojitWc4jDRo/3
         3Crdagy1JNb/BN16qp4rZpSQt/S+1GbOyKaMGz70SHqFQaW+8lbGnsdUxScH5fJEo6xy
         UsMhnjeyV+KYjLaHbiIYl7qFu8wQikTN8pRfK7IG8OKoDODYnuh4kqHZQY0jp9GmJArd
         qjVcS47CLNJfSsIT+lubZgAYuC3f4LdCMafu4viEkm9kGz8zQB7Nh1bHMY+un134QVQf
         NVx2jXZF+bkf02ecXOZpobNWLXqOMK3KGanYAt5cb3GvdXyPxUi2AcRldYFzoNO+Xe4G
         pcAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0ocr9aK+b9r6Rtz3bWlgVWUngF2/3ZKqSJHdKZbdikA=;
        b=RA7zmf6q9wNxHICVWfrC0x/icUTx/BRZhIGFIKnpkD0Pfe4aUHRIVs/jpad97teeZT
         huNsFNvpfzpHv4a014tN9lIo0ET6BSxQEXxNQqA7o+KpKo+PIB8O3i59KA22iKRM2DB2
         IY59hWV89WjuZcSPJaafY6zSmn52ffE6xK606D5mc7VACZJOkfjOUzhboEUw1DQ+wO/k
         guyLf5D2JF+FJlGUttftsl4EAO7h0gYopuQFgpkxCR3C6P8EAeJqNhNq1YCFT4SDY1ct
         r296DtH3EbR7/19XW+k5XG6OXvCiPPcVTA0Ie4wEQU4exKwOvgWYgCoHLluFRCrvS7TC
         z/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=0ocr9aK+b9r6Rtz3bWlgVWUngF2/3ZKqSJHdKZbdikA=;
        b=CW9hg0Crzl5tcZ2EI/8lFQhe1lezoSeJUIuhGPUTy6/72zFx7YoirX+YKD4B8C64Wc
         4RZV5rfUKYuHgfHH12tXTt6dBGYMyzIA63RKuIOwpYXKQvUXRxWhDbHxG/zMYLRNtFpD
         gFWviZ/U+RImjn7rds8O3Y0EdTiEnzVWt+5QT28ADXYeryY21nf1zFTS0xnjBB8fvtyd
         /Jb3yUHOMdNtcwrvoUtU8vFUZPmY461ZXbM6VU73Z3urNYtlp8j+1cfJnczTCjeNnhaG
         qLvMLHCsizarIWUikygMVJzxdzifRhtmANzdChoNRLSkQ3/ulLRQnfnuZx7Mn4T3U4vx
         /9Ng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5304P2IXVX36ci8y5bDDqcSCmBBwH/m/V+Z4ckUjP0lpSP6tpUrN
	2kDCydwrPB4kwlhWXECQzYE=
X-Google-Smtp-Source: ABdhPJx34FJ+uqNWuCuSWvgwSC3/agzt12ZStUTpmJWUHunJk8CeP6U4k7quQ8Lc3bDhlDPoCZk4qA==
X-Received: by 2002:ae9:f201:: with SMTP id m1mr29721610qkg.381.1629882781246;
        Wed, 25 Aug 2021 02:13:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:2a05:: with SMTP id o5ls819927qkp.8.gmail; Wed, 25
 Aug 2021 02:13:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2012:: with SMTP id c18mr25906136qka.312.1629882780398;
        Wed, 25 Aug 2021 02:13:00 -0700 (PDT)
Date: Wed, 25 Aug 2021 02:12:59 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <185ddd7b-09f2-422f-ab16-309ab34c0ee1n@googlegroups.com>
In-Reply-To: <e81df823-0997-4dc4-85f7-8fb3632d9d57n@googlegroups.com>
References: <e76f8186-671f-45c8-afc8-8c85b3988c43n@googlegroups.com>
 <dd34eca0-5093-ef58-2084-0bec72ac1b82@oth-regensburg.de>
 <ccffba76-599e-4776-9c37-691de5de7cdcn@googlegroups.com>
 <e69d0408-a3db-7f6f-75db-681719a44391@oth-regensburg.de>
 <e81df823-0997-4dc4-85f7-8fb3632d9d57n@googlegroups.com>
Subject: Re: Building a Baremetal OS for Raspberry Pi4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_486_1969110671.1629882779696"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_486_1969110671.1629882779696
Content-Type: multipart/alternative; 
	boundary="----=_Part_487_193156978.1629882779696"

------=_Part_487_193156978.1629882779696
Content-Type: text/plain; charset="UTF-8"

Hi Ralf, 
Thanks for the instructions and your patience, you can find my patch down 
here:
https://github.com/mustafa13e09940/jailhouse_rpi4.git

All changes are in /inmates/lib/include/BSP_BCM2711.h and BCM_OS.h, I also 
edited gic-demo.c but everything is commented. 
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/185ddd7b-09f2-422f-ab16-309ab34c0ee1n%40googlegroups.com.

------=_Part_487_193156978.1629882779696
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf, <br>Thanks for the instructions and your patience, you can find my=
 patch down here:<br>https://github.com/mustafa13e09940/jailhouse_rpi4.git<=
br><br>All changes are in /inmates/lib/include/BSP_BCM2711.h and BCM_OS.h, =
I also edited gic-demo.c but everything is commented. <br>Moustafa Noufale<=
br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/185ddd7b-09f2-422f-ab16-309ab34c0ee1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/185ddd7b-09f2-422f-ab16-309ab34c0ee1n%40googlegroups.co=
m</a>.<br />

------=_Part_487_193156978.1629882779696--

------=_Part_486_1969110671.1629882779696--
