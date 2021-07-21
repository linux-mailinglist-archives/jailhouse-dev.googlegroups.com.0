Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUHS4CDQMGQEYQPQIUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF9D3D120B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 17:12:17 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id g13-20020a05600c4ecdb0290242a8f4cf9csf687601wmq.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 08:12:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626880337; cv=pass;
        d=google.com; s=arc-20160816;
        b=tyeEjAfvRvocxNTwyziDsd8lsX/sNIVj8HRfrnzZOBjV8QqrUxaB4b0BZzgnw4M+oX
         dV3nbAvOtXJ6M7jhVSopykFN87PZg3XSDynzAzMIt8BoxDO5HnEO7WNS/lSAdIu+ZSfU
         hBcFr75zS+N39ThEcZIzCLFCZJhmwXHr90djamDVl5KqvPpMdbefdpcVxQlTuP2YKIng
         kn6imBrCsjcvnME/6JwDfV2fZbYX3bxACkZMUKKk/iEGGRg2FzEbsv3m/IuXG79KNNvz
         Kj8aXwkUrRuFA5JSGSoheemlFFqup5L4rpais+qyHnT1lV+174fQfMQADMN8i9mDhXv0
         jh0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=EGZlevBm4j7OcT8m5JYtPAoEHE4Ybj/Xw2ZQSBPuq3M=;
        b=B/UfF2pinVMcOg4NlXVSABbPo316WPgNiUh/DXBPSTmgX3fDMhZfqVaJwo4xHxKlj1
         X/Xh8WfLDi6WgBnFW/8Tnz5/0ZsjOaikZaryfYMj5ZYH5HB0DqupCroT9ysAKGEO8KGT
         03NyxJXqBmJ0FsGYgCfHa6A7vTyaIhZw39LcT387FGVu4NVWAl93sp50mIi7kpD13I+h
         Je9pDPZP9YaHw1QBV3bM3iAyBff2v9KzbY14v3hIA56NbjOppyEDqiFfekxi7zhJXpaF
         iWZ9iAmTS3gSqD9j5wiDSNzNVHAdHUYy8s0JLBG1S31EohxKWQtQgmbvvuKTZx5SkuIk
         RFHg==
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
        bh=EGZlevBm4j7OcT8m5JYtPAoEHE4Ybj/Xw2ZQSBPuq3M=;
        b=BGuC0zQSOUvYznmM4C2hxeEOkFKaJsGbaPB8I1/gmOgkyumXulEo1ve08KFdFb5C/x
         b7a5vFom59s3tP34Srx038o/d2P5R2lvzUvr8hg2nF92cAtCtgb+Vxor7tSlnvD92huK
         1qoZaEtBv199lZzhJCHKuvyHBqQtRlqyYOhxmphdm6DJ1/u07MqiyCarUHrT1X4FWb8G
         inaBKdtELVR9VtrRmS6U/egNPDaSszDsuPkczsjvbrYZO4nfrMnyHYMT1Qd1F56wO/2u
         nmADCMDhM9p7qhjcFYBwT1njZ8+5nzg7Erlmy67Roq1B6vKGt9P7vs61OoD6JNRZq/AQ
         n16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EGZlevBm4j7OcT8m5JYtPAoEHE4Ybj/Xw2ZQSBPuq3M=;
        b=qMC/lhRbKmcv0mklut+iyMedtJCeQh3js4a/Cn+EFUsObOkf7lCneA7xKHGTVYS7Vs
         hk4oauBLUoPwkz3YGPoasnAREdPMLaRsJs51NTA82LDDjEvN9U7cTKaNKvBW9G3SdMU0
         8otHB/K8R7LfF1Tn5KGNJuPGA86thOCgDBXt/wxBt9wPn+uzFD4NwiyEQiXRyzH8vS+k
         VwsvTRFyoeJfobKJFAJN55Rwox5NpH7wheQ+EG7Kmz3Yl6tBbFrDYcL4CqTccufarwYa
         EMq7Y3pqAvgW9SYL2Uc9uJ/u6b2A8JwvYP8lxYlVXEfADcfKstJKiVTCVAIjaT9mHah8
         G6Zg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315pmmDM7GIayp3Sv4l2YvE8X6gPVGOoj2OhpSPqGlwKrec5Rrr
	DDcBzAFAzk7eYY+vGoTYxfE=
X-Google-Smtp-Source: ABdhPJzYc0BD1xukoel2V9eoxyxqlb/wdEEaR3Wf+GJxfTbIRBQ4++vyTGkApw6MacY8kBazNPnVGw==
X-Received: by 2002:a7b:cbda:: with SMTP id n26mr37611989wmi.179.1626880337231;
        Wed, 21 Jul 2021 08:12:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7e90:: with SMTP id z138ls3163321wmc.1.canary-gmail;
 Wed, 21 Jul 2021 08:12:16 -0700 (PDT)
X-Received: by 2002:a05:600c:2197:: with SMTP id e23mr38216229wme.101.1626880336172;
        Wed, 21 Jul 2021 08:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626880336; cv=none;
        d=google.com; s=arc-20160816;
        b=YshnUP4+zYcGgVnJWXMrGJPCM7J/cXUfpWtuVt698RnL06gNnNy1U4PGuoFamsbphJ
         nRdIhu6j7igY6qmvKfF/yJ3gW7puykv0DfYxknATO1nIbIPWOUWuKgL5ZSkbt4ms3PJ4
         OvuAhnMsxJ0nZRjSdG3E/KQm62k/10uHzINg1pmh3MiFsXLSzTmheoR9rrKnkVKukJlv
         uN/mbOO+jsdlUg+mF5f13xkMwGaCKKH3K1V6T3xjsLTNJO517Ax1yU/6DoJbY0v7cM9+
         5I+oVJivTos6hIIlO/pxpckUlpUumTUiE1GIcu4sNzR9aS/LsSC87ddJcyRLgrRKnHO1
         zDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=MszuMufAFNkpguhmrZYkN31kIi3PKuBZRmdPxKrWSL4=;
        b=GUFUa/Hy+qaIW81PqpHXtunbsPdOdY5MFpFA1aY0CYtBqJa6ot1WLHsYTW2ASBaTRG
         SVxTmjgbtMIWPMjCBxpbYbUJJzdxHldREi6mjW9xIlujJl4/eWJB94ISiLTH5yj5CAH1
         ckTRZZLcYw7/DON+DQIddJGxIrF7kmV19eUQgb35FYFgluqxRiQHjxbaojkV4Gtw/B8K
         LA+PhEe43SD/paGWxv152AIYoyaYrh097i7WBbSMPTDvwsvluynBKtonmjezvz0tOyDS
         xGCSCHR/B6C94H7+pWiue1pfmj7QA2bCtowtzAR2Gh55neVFe4Gn0VUrLF2mfsjwKSCb
         Oxxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v4si1188158wrg.2.2021.07.21.08.12.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:12:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 16LFCFWZ017688
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jul 2021 17:12:15 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16LFCFRB026346;
	Wed, 21 Jul 2021 17:12:15 +0200
Subject: =?UTF-8?Q?Re=3a_cell=2ec=3a243=3a10=3a_error=3a_implicit_declaratio?=
 =?UTF-8?B?biBvZiBmdW5jdGlvbiDigJhyZW1vdmVfY3B14oCZOyBkaWQgeW91IG1lYW4g4oCY?=
 =?UTF-8?Q?register=5fcpu=e2=80=99=3f_=5b-Werror=3dimplicit-function-declara?=
 =?UTF-8?Q?tion=5d?=
To: =?UTF-8?B?546L5paH56u5?= <wenzhuw@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <fc0f1d1e-0132-4c13-a98f-eb50679447a0n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <98ff0faa-73fc-e532-355c-c131b90de694@siemens.com>
Date: Wed, 21 Jul 2021 17:12:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fc0f1d1e-0132-4c13-a98f-eb50679447a0n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
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

On 19.07.21 17:10, =E7=8E=8B=E6=96=87=E7=AB=B9 wrote:
> I'm working with Jailhouse for linux 5.10.50, which is downloaded by
> "git clone --depth=3D1 https://github.com/raspberrypi/linux".
>=20
> However, when I try "make KDIR=3D../linux" in jailhouse, the following
> information output:
>=20
> CC [M]=C2=A0 /home/pi/Downloads/jailhouse/driver/cell.o
>=20
> */home/pi/Downloads/jailhouse/driver/cell.c:* In function
> =E2=80=98*jailhouse_cmd_cell_create*=E2=80=99:
>=20
> */home/pi/Downloads/jailhouse/driver/cell.c:243:10:* *error: *implicit
> declaration of function =E2=80=98*remove_cpu*=E2=80=99; did you mean =E2=
=80=98*register_cpu*=E2=80=99?
> [*-Werror=3Dimplicit-function-declaration*]
>=20
> =C2=A0 =C2=A0 err =3D *remove_cpu*(cpu);
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *^~~~~~~~~~*
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 register_cpu
>=20
> cc1: some warnings being treated as errors
>=20
> make[3]: *** [scripts/Makefile.build:280:
> /home/pi/Downloads/jailhouse/driver/cell.o] Error 1
>=20
> make[2]: *** [scripts/Makefile.build:497:
> /home/pi/Downloads/jailhouse/driver] Error 2
>=20
> make[1]: *** [Makefile:1824: /home/pi/Downloads/jailhouse] Error 2
>=20
> make: *** [Makefile:40: modules] Error 2
>=20

You likely used the last release - we didn't update it for way too long,
and that version was not yet aware of the changes 5.7+ would bring.
Please retry with current git master, that should work.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/98ff0faa-73fc-e532-355c-c131b90de694%40siemens.com.
