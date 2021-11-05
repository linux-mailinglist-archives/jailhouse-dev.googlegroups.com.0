Return-Path: <jailhouse-dev+bncBCA7ZIXV4AJBBS7VSSGAMGQE3FJRX7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EE94464A1
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Nov 2021 15:08:12 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id x7-20020a056512130700b003fd1a7424a8sf3615047lfu.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Nov 2021 07:08:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1636121291; cv=pass;
        d=google.com; s=arc-20160816;
        b=JMEsdbUBoLIAEypwyqD9ConoBX16q3vNpipAKpPslISmg+XLIvbkB7aM7YjoEd/z+A
         6ZWEsRoHsJkS6HZggXhyr8hmEGLOpr4scLw1n4ZgIv7x0UxcH4dAF7m7ROrLSA7Skdk7
         fLi8mmHVkb47nfjgi1e/Eh4sYqSJEn3Qfc7A2J30rT8+t8eapIa2GRKRr4vrt75NPX8T
         dioWGuG15mkMgXLUcmNiHtFVoHl67+oTklN21meLwuhMaAmMTRlbIEjd3gJcAiXLmPuA
         DWEUpiUgNKFlzCNif+CADjNo6xmHCrAa92n2piCIQRaZ0rzHM7MFImsBxoRMWJ+IBQo4
         wlrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:ironport-hdrordr:ironport-data:ironport-sdr:sender
         :dkim-signature;
        bh=DghZ9kW0fXAeNehbFIUCnhBIq92iNNsf63Rw635GAnY=;
        b=supWFe8vovoZ6pZ6rbQWLBJLa2m1y4Yie1jlC5yDKzQojKqo4iIShHaXh2GaGLWHlG
         f6s2Z1vSvfBE6S3GxhtxREoo9/Q5Vb/tzL/pUsmPVNnn8ZNi4Smpasky1G/Fq0K+TtBm
         ePBJS3lhsUQ13HxBFMA8md7PpUp3X3QGptMft2I4KLJ0KTrDf388klVgrLTUPbeJ5XMN
         6mXDa+0P//lfCaDtyHv55GEOlk8ZzeNB4VsMlAFZF5dETvkozORYbwEtLozjIbsvSz23
         0UnNRU88w05Xib9UerDOqOtr0nDbdx4reK5zmVcbuFfo8aH4a825ZoxElRZ9UD9DMCEl
         B1Lw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ulmapackaging.com header.s=secumail header.b="FAN/hpFL";
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:ironport-sdr:ironport-data:ironport-hdrordr:from:to:subject
         :thread-topic:thread-index:date:message-id:references:in-reply-to
         :accept-language:content-language:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DghZ9kW0fXAeNehbFIUCnhBIq92iNNsf63Rw635GAnY=;
        b=IbaEmXRkVmUzYxU6ASHfBvRodaREvXvgHnWbdtqDSdRwM+sgfuEa9rcV+8fANwgPqu
         RozyT/9po8lp/u/nK6mcgh/JvAemQB/haj73fA2rlK5Vfd42sdwEQHIvM7UcMAnXVAPP
         IfEyM+erRtX7tsvKgoQeCxpGsCJyZJ5VqyazPqOOe4CvSDCu+x7/zvY+BctCbpgfMHCK
         PrXigl/vKBdvoRP3lxSGP9GvsTaaFSRkhf+SzX+MByeLKnHhDkyXifU4JTgDHirr38Wv
         FrA/YqWZIM6Xt0tCzPWhP0aZCIhFaSpA5T0NrV7CXdCtwkie+D+Z/GtOyDAUf2s/3JkU
         oz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:ironport-sdr:ironport-data
         :ironport-hdrordr:from:to:subject:thread-topic:thread-index:date
         :message-id:references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DghZ9kW0fXAeNehbFIUCnhBIq92iNNsf63Rw635GAnY=;
        b=WcJ4xaiWEuWsDlKM8UkbHkdqvLzpvz/NTOYoAXaakcN1mSA9h72CTirR1G3BZDFZnJ
         98tMmilOvCRPcWoJYdH7ZT0QIJpFYLJhee7QOGzkBSJFWhMmAk9hJgz5najblhAfbDUY
         v6caZkbGKyesSngVJqIsTnFhegbvoWcblC8tjJv+GTaDUlTgq0InzjMvs48Rqfxa9wp0
         Ht4et7qZQ4VvRGvpDMW34pSuEnmaOOBdoC2Wyko4TBijnZ7m5nkXI4omQqHvRvUzYpYo
         kkSinw3IvIWqJShCumgci+GzO3QKCT49x5a9NOm0eABm2HDNKNEpScxmP2qqz4cMLgCX
         vJhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530vEKyw9iagHhNLA/3GrkJpppDYbMzPSV8iABdzL+BzdrfIzEFV
	FlYq/colHbnRZOOge9uTYkg=
X-Google-Smtp-Source: ABdhPJwkbANWXjg9RmGma1/+m2ETvQy8zY6ZBkPnO9cQXo4SmKLl3z46TZWNYeFVmn4RcSDUUU+bKw==
X-Received: by 2002:a2e:9b1a:: with SMTP id u26mr16714202lji.483.1636121291665;
        Fri, 05 Nov 2021 07:08:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:4a1a:: with SMTP id x26ls1594374lja.11.gmail; Fri, 05
 Nov 2021 07:08:10 -0700 (PDT)
X-Received: by 2002:a2e:8107:: with SMTP id d7mr12145285ljg.376.1636121290352;
        Fri, 05 Nov 2021 07:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636121290; cv=none;
        d=google.com; s=arc-20160816;
        b=qyaJ9FePZVj+R6w+Lufw5eezL0qjlktQfrx4XpJtUZGsSvbOOK10xl1X00X6Awidki
         BGRmzvksMMyWBfn3W2fiD8JSzPFQFKkhDZHfqF4UXEbhWDwN4BB0Zz55QF5wxWg2bCbf
         Kgc7PsNqG6Mv8CjUdLBXZyfLFuHOv4NWp6rnPOlFs4X6Hs0loNIlX+twCO90wKewRgA1
         SEmxfkj2jomTeo1w7mkaoSZ8Rdrb4xiZj3VCS74eOUiQDUFvBj5nGsTF1+zlfZl2G8fY
         Kghu1Bsibt9ARzaN+51n6eDBreUlHBnmpZr6l2hk4XyPoNt/WEZ/uIWI5M6bzUIgopSV
         LC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:ironport-hdrordr:ironport-data
         :ironport-sdr:dkim-signature;
        bh=/Uu6EGjFpxqJOs8/KmGz/HsRwAdK3WqOx6jvR5J4+uQ=;
        b=Qt+1g+HBwD7ykWmfUlbBoIltbF9FPXKLAQmJRfVqrTMwUYvK+4vyTQaQLXZXCRR3RL
         USZOMszf+1nynG2H2TpcspPjiw5KZR70ZQr6NOdUd/A2+Sjg7pt7XhvMzfd0Nmhzin7J
         NEDJiSoC+Jh/POF+88I9Iri7EL72ch0g5qtxXYfX1gah/q8wqUY6xlseS1gSh+k+VfwB
         lMHvlVJsYciqT/RBfF29Xl+YY/toQPrz4LOrWePoVIb76xkG5KREsTN88wVjwaSxsBC/
         4B0qMg/9G9hbawrPamczw3ZQ+lK16L/5kyy7GouDcqNdCqDangyzhSkOUoY7c4q3MKZ2
         jQpA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ulmapackaging.com header.s=secumail header.b="FAN/hpFL";
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
Received: from mx2.ulmapackaging.com (mx2.ulmapackaging.com. [212.8.121.109])
        by gmr-mx.google.com with ESMTPS id t71si323175lff.6.2021.11.05.07.08.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Nov 2021 07:08:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) client-ip=212.8.121.109;
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: FOs0weeMeB2p5cyV1oND9iSfJBe1euEPa98u5FUV0jWgy1cdVAynNXbkjLzGGBbkepGaN7Nzhu
 39XQxQfSuoJQ==
IronPort-Data: =?us-ascii?q?A9a23=3A60xhlKNiKSx2gfTvrR2LlcFynXyQoLVcMsEvi?=
 =?us-ascii?q?/4bfWQNrUp21jFRmjQZC2yPPa6PZDTyft91aN/lphkGsJTdz4M2HVdlrnsFo?=
 =?us-ascii?q?1CmCCbm6XZ1Fqp5Vs+rBpWroHlPsoNONbEsEOhuFiWF/071b+C6xZVB/frgq?=
 =?us-ascii?q?oTUWbes1h9ZFVcMpBcJ0XqPqsZh6mJaqYHR7zCl5bsel/bi1GqNgFaYBI62B?=
 =?us-ascii?q?5Wr83uDtNyq0N8RU8dXifpj5DcynFFNZH4TyD3Yw9IVn+Bp8uCGq+brlNlV/?=
 =?us-ascii?q?0vC5xx1U47jir/wcUQFQ7jdexWKj3MQVrPKbhpq/3NolP9lcqNaMBo/Zzahx?=
 =?us-ascii?q?ridzP1XrpW/QB07N7/RsPkZVhBAGip9NKJH/rCBKn+62SCW5xaeIyOwnawG4?=
 =?us-ascii?q?EYeeNdwFvxMKWNH9PgYLy0WY1WPivyez7W8Re1hid4kMdHweogYvxldIZvxZ?=
 =?us-ascii?q?Ro9acmcGeOTu5kBmm5t7v2i1M32P6IxAQeDpjyaC/GXBmoqNQ=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ApZSVX6juARfVa0PBlLCZb6gQW3BQXv4ji2?=
 =?us-ascii?q?hC6mlwRA09TyXBrbHLoB1p726StN93YgBcpTngAtj7fZqyz/5ICOUqUItKGT?=
 =?us-ascii?q?OW3VdAT7sSkbcKoQeQeBEWn9Q1vcwLT0E9MqyTMbEQt6nHCXyDcurIt+PozE?=
 =?us-ascii?q?nHv4vjJjxWPGdXgulbnn5E4hDyKDwPeOBpP+tDKKah?=
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO spc015.packaging.ulma.es) ([172.16.1.15])
  by mx2.ulmapackaging.com with ESMTP/TLS/ECDHE-RSA-AES128-SHA256; 05 Nov 2021 15:08:08 +0100
Received: from spc015.packaging.ulma.es (172.16.1.15) by
 spc015.packaging.ulma.es (172.16.1.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Nov 2021 15:08:08 +0100
Received: from spc015.packaging.ulma.es ([::1]) by spc015.packaging.ulma.es
 ([::1]) with mapi id 15.00.1497.012; Fri, 5 Nov 2021 15:08:08 +0100
From: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: Problem: system hangs
Thread-Topic: Problem: system hangs
Thread-Index: AdfRb/yz6sETOSkXRaWPtbwUlYSPUgAC2KMAADNQZbA=
Date: Fri, 5 Nov 2021 14:08:08 +0000
Message-ID: <27a4c02436a9462d89b69fe1a82497d9@spc015.packaging.ulma.es>
References: <462c8035821c4482990bdec49113221a@spc015.packaging.ulma.es>
 <20211104145624.5fb4b0d4@md1za8fc.ad001.siemens.net>
In-Reply-To: <20211104145624.5fb4b0d4@md1za8fc.ad001.siemens.net>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.87.145]
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: rsagarzazu@ulmapackaging.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ulmapackaging.com header.s=secumail header.b="FAN/hpFL";
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates
 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
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

Hi Henning.

Thank you for answering.=20

> -----Mensaje original-----
> De: Henning Schild <henning.schild@siemens.com>=20
> Enviado el: jueves, 4 de noviembre de 2021 14:56
> Para: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>
> CC: jailhouse-dev@googlegroups.com
> Asunto: Re: Problem: system hangs
>
>
> Am Thu, 4 Nov 2021 11:47:00 +0000
> schrieb Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>:
>
>> Hello all,
>>=20
>> I'm experiencing a "system hanging" problem when jalhouse is enabled.
>> It happens with just rootcell enabled, no need to start inmate cells.
>> I've been working on it for several weeks trying to have at least an
>> error log or report but I didn't success. System just freezes.
>
> You should see what happens without jailhouse. If the hypervisor was
> blocking any access to anything, it would tell you. So it might be that
> it in fact has nothing to do with jailhouse.
>

I agree with you but I'm not able to reproduce de problem if jailhouse is d=
isabled. Even if after having the jailhouse rootcell enabled and successful=
ly working I disable it back (jailhouse disable), the system never hangs. I=
t has been running for several days doing more than 500000 launches/kills.

>> I'm able to reproduce it by launching and killing an application
>> repeatedly. It hangs when launching, not when killing, so I'm
>> thinking it could happen when trying to access an invalid memory
>> region. Could be?
>>=20
> Unlikely because applications can not directly use physical memory.
> Unless you have an application using "/dev/mem". In fact you can try a
> dd of /dev/mem and break out ... i bet you would see a hypervisor
> violation and not just a hang.
>
> "dd if=3D/dev/mem of=3D/dev/null bs=3D1 count=3D1 seek=3D<address not all=
owed
> for that cell>"
>
>> Sometimes it arrives quit easily,  just after some launches but
>> sometimes it can take several hours, more than 7000 launches ...
>
> Sounds more like a memory leak or something, a memory leak would also
> show quicker when running under jailhouse (with reduces memory).
>
> I suggest to valgrind that application, or just keep an eye on "free"
> as you re-launch. Regular applications should not be a problem, but say
> that application re-loads a leaky kernel module ...
>

The freeze occurs with different applications (some examples of Qt5, some d=
emos of mesa, ...) but it seems to happen just when using the graphics acce=
leration (opengl).

If, for example, the application is launched through wayland+weston but acc=
eleration is disabled (--use-pixman option in weston), there is no hanging.=
 On the other hand, if acceleration is enabled the problem happens with X s=
erver or wayland display.

I checked all iommu related configs on the kernel but I don't see anything =
wrong.

Maybe something to do with drm i915 kernel driver side?

> regards,
> Henning

Best regards,

  Rai.


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/27a4c02436a9462d89b69fe1a82497d9%40spc015.packaging.ulma.es.
