Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKENYHTAKGQEF7XCDNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382C14C2E
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 16:37:28 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id r7sf10712288wrv.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 07:37:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557153448; cv=pass;
        d=google.com; s=arc-20160816;
        b=T9EIPCOsYWHg/RL22DoW/rNZSjQxvYV9vhIlfXIwmQNnzRE5A94jdSS3RQcNfFM5oE
         jXXPXkGgGrt9qxjK4U8XCkAB9wmJG6wPZKAXSfg+YKhIyGlKshdGZDdRHPeC6XJh8flI
         iqRDkfsvJBHGXJMeyQ8cLqaILIu5wwnnpOCeT+LpE9rDW20BerxuFVeLVn206g20Nfwh
         1FAldo4+yrX+wu1ELDLURdz3WIgWc/6ik8sRXK3h9mtzudbMD+fsyffgDcx8i0KEws3o
         lEJfnxPlrqQBVX07LESVnF42lW3Bi+/Xx9RMZ+NPXTM+zpaCpv+El0gk3XyEfA5Vui2A
         vUQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=EeShhaKkto5wVgVhpXFeYsV6lKaQgdiSeNFjJnbcez8=;
        b=kauVx5PiJakjfhvWFQdqYSsZTrpPxVDjSAIU3O5sra1dLhRhQhxgj6XiSu9ViDaQSj
         7w9Pjg2ibsoQ+8gcMxfCccZHkbkm7z/wnZP21L0oFutzbCSPGnKAJoQ3IMa5UWx+TYwf
         dLb1Oh4HK0836XydmrzHyo8d6Jla/9Shpd2H1BUrv7lYlgPg1BpTBRMQ0wsxlb8Xxf99
         1ovtCBJrpi7tUreDlJVSQnz9lInGEDZ0npT3eP6I6vHyirt/+NXHadoCHIbun6vx4QQC
         IPO+qlZvESsJCAexc15N+yDTwjWmHrfvAHrcb0JjQQmcy496jSdDmz4lNLc0yk8g6Yb+
         0USw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EeShhaKkto5wVgVhpXFeYsV6lKaQgdiSeNFjJnbcez8=;
        b=asx6T4K2qkeC25cj8okCGXDeBXoBMN8OehQonL6PQntUHAeRyeE+SxTv0D+94L3ICA
         fWeGlGv2qf4mjP89fXsPnstop0wZxWAbIh1MTPMPikZJFGjmVxrFCj3gmIpsBkVERKxE
         mdn3TzHsNDR6A+R1YkXnqYMMJYSAVFjemSbvdk7pP2o6CNX66YFao3978b+zpm3UrZTK
         dbRqjoXedZZecu2NL9xh430dQ7RPW9cmVJpE84zYo8vgQmLBRUmIO9CLXzAwbLw3OfiC
         HbOoXF4YODSiD3QYplft+vX3jr8aa695TvlFQ5+C6nItrLNmkqsNWUWxEr8l9joPl/jI
         mKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EeShhaKkto5wVgVhpXFeYsV6lKaQgdiSeNFjJnbcez8=;
        b=snRj5inXea4otBZA/DvU2e2YGEBlaNTcPF5PnjOhldWHSiqXy+CbfU4ey8isoCBF3A
         yJVDme2TTQj+qw19RNzq2D0mY1SZ1fWPEGFLSyGKyVrb+KS9vgSF+gRur4lPh5YF32eW
         nbIfOx6mnBlxKMXGO0IegRkZbmbTlJjv1H9uNZa2kfliRDUp0bdH8TWY54A6GxUeXT6e
         /Msvl1/a6OeV3kLe3aA5xbGppmihA1NuO/v6frU5GsXG0pfgJBQQKsg8nQZLXVvAPkKg
         xpPCg7+VA9fMQC8mlasG3ibyJm2dChsnKUl1MpNr/TKwWaM5iGD6+MNnext2kPbX+3MD
         hrwA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW8Zq/NQm+WFeVdXdzXeEGnXr7m3dAJNRIKVAxVjo+sV5JyLu7f
	+5yOxrYAS6due20os1lHyhQ=
X-Google-Smtp-Source: APXvYqxb15bJaCHrD8cPsvyb/NanDdEUfizDGKFbqgXsVznJ6ST9EXvoisw50P3jUst+RG1VbNyZ2A==
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr2532079wmh.93.1557153448268;
        Mon, 06 May 2019 07:37:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d4cb:: with SMTP id w11ls502139wrk.7.gmail; Mon, 06 May
 2019 07:37:27 -0700 (PDT)
X-Received: by 2002:adf:f50e:: with SMTP id q14mr730068wro.48.1557153447672;
        Mon, 06 May 2019 07:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557153447; cv=none;
        d=google.com; s=arc-20160816;
        b=TI+ODxcdhZYE6YWlBcEg/CP7kbtO/Ufh9Fexb9Mne2vMZz8OlanBKtT3S3/604wW7B
         J7d0wolg9KXfZ6f+/EGm3RDe161yTJQ9uASnHTrdMHXup0/Y3uHsRfeyLuCVb0m9sN8y
         tp9c9KQ0VhQbaxBjtxTwW3iSnRO1iPffCttIbFM5WxK+F6dAPvXWdGohapTfMPwUbebo
         bj2KL6RIZwOk8iuuO+7y2veqBWZDAi7IqR8DV2BiRMJ20gvsk/iwTP6Scms4bgel1sUu
         QKI3ajUkU+Vo12i/guQjANxKwCBlSjE+j9y4WdP3Q6ZZ/3OkoYEAz82gZiojIjdmRsZ2
         4j+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=aJIXxXLNjIX1umXOS1CLfhXQO+OJZ7GZ+lwUbiLH/Dc=;
        b=ht7IH8nMkNbQBVAQJoLpHTGI3kW5HwzEjsVWHmKTf4oTpelgmKxped0TB/W0maCnag
         4L+5ZGsrpwbqWoF8JselT2ohHEVWQssQ0aLGcKGcvgc3jsQChboYLtddkFt7LtYk6yJB
         +SkyMgDJ84lhH43sWAlcHO8V2QA56utmP5ZG0AJQp/YUZaLhnClLA5wtM3hPw0c9vOep
         AK2iTZGyUZT3pKMm1xiKDmx2LUUmC1K0RUGhzufpThVl/PRncxYDCKwoF6YF03u+Mcgs
         L7/DPeymdc8i4zLAD7Stfqz2YVvgfdo6/q8gj6vRlukapGDK9N00wJXTNGHEx1xQdNZc
         CZ1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id y72si997791wmd.3.2019.05.06.07.37.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 07:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x46EbRIu027839
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2019 16:37:27 +0200
Received: from [139.25.69.165] ([139.25.69.165])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x46EbRIE027782;
	Mon, 6 May 2019 16:37:27 +0200
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <de3120a5-36a0-a681-1642-5fbabaf6b524@siemens.com>
Date: Mon, 6 May 2019 16:37:25 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 05.05.19 21:35, Hakk=C4=B1 Kurumahmut wrote:
> While kernel command parameters are intel_iommu=3Don intremap=3Don at som=
e machines, cat /proc/iomem shows DMAR region under reserved section. This =
patch must be done for config creation to complete because of generating DM=
AR region not found error although it exist.
> If this patch is not apply, below error is throw by "cell create" command=
 whether intel_iommu On or Off because "reserved" regions are currently exc=
luded from the generated config although DMAR region exists. Thus, DMAR und=
er reserved section must be parsed by parser.
>=20
>=20
>              if size =3D=3D 0:
>                  raise RuntimeError('DMAR region size cannot be identifie=
d.\n'
>                                     'Target Linux must run with Intel IOM=
MU '
>                                     'enabled.')
>=20
>=20

Some formal remarks:
- we need the signed-off line, check CONTRIBUTING.md for its semantics
- you will make your own and my life easier if you commit your changes
   and then use "git format-patch" to generate the email content - or
   even use git send-email

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
