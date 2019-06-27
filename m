Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCOW2HUAKGQE5CEZNSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2B957CC0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jun 2019 09:06:50 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id m23sf5332905edr.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jun 2019 00:06:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561619210; cv=pass;
        d=google.com; s=arc-20160816;
        b=j0yLs3/qVkSP+2PIpQDNpAtzhMCxpY13/GQvzuSc/2xtarFNOCssYNv0/jJQeEAx9t
         aFfEdGpud+8z7wiz5Gj9XLBSCcD6XQb46ISwOXUPz2uhPBybpYnhwyJdVtg1pcKz77pf
         5UQ1+07Q4/xJZwrUC7iPqOi0NZFbudBLhqJUyL1wRriPX7DE4yXI7cwguTTXgT4DyBOr
         aWYDb+e9OA9IDZqpde0n6b29NM+rxiWZ7OMk8bMahw5hTLNFf6rc4H4BQA1NKsYr9N1T
         MUnm2kIuQAr9wisbDxFpyPt2v7gj/IXvb0gdxvyp813y3vTK1dyLKfgTfhkt2aC7L+ZY
         5eUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=/vV91kVa9MxB8wCspwdNbWDy6lnF6uEQGOhE3QyRIwU=;
        b=KpKXDxoW7V/EUkz+VtyaydQwFftsnMKF5MGaOs6YUhoxHKGfSMqpfU7yVIwFhO/e+F
         haf8b5IDuIJTd0b1cHnJU+WU1KSrPZR8rD/Ozhrb7R6XmtS7S58kg62CCCSK5v5s+lDY
         7cl2gT0UGWTJ4nUSfmaB7hd6QUEKOhfUokh3Ea9q/Q/E3S9nlsefKM+3EwJVrWaFo8K+
         q4KvvBaEsPm4aGPpJcVnf0d0dKf5O+Hzxv1ePFcsJ69aH8JNJQCT6gAPPbBGUDeXz4mk
         Mo96x87swWTZ9uX9fBK8yffBoxl3qNF8JHPIg+URtzmmdRlrC5/s3wMEKvwbO0TD0NbX
         +0DA==
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
        bh=/vV91kVa9MxB8wCspwdNbWDy6lnF6uEQGOhE3QyRIwU=;
        b=iT4bVTNgfenOccFp5PLwy6kNaDAhkez9xX39OYOENtKlxe8N9Y8BDqsuP0qSJ1lt+o
         A5gZj+EwTJNRCVF7iKt7rp1qcHp/KjiT2bHz1Y8yBPKzOMx3s2IXBqcaUCVupptQQQaT
         /68di62KJ2xGV3yuXSczwpbpc8GFQXt5QGlLzhFTBGTXENsuy7Addoh873ZZd6D1ez3q
         ucs6B6sXmkGLMa8RVJWIexFgjimhXAKYZ1Nxemo+8OveTiKzy7EVWaPEiJLoX4niJ+GT
         h4AjpqwliD/hUOffQGrlWvxE0/AKvFMDQGzKwmTgxNL4Ngomi37g7Auw0EpY0l5JUqiP
         OXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/vV91kVa9MxB8wCspwdNbWDy6lnF6uEQGOhE3QyRIwU=;
        b=rZnVwhaTD6LQbX4tVcDhyI29eoxsuuA9fifAAG6x5yPA6VsRZ6JJu927ToYSd5J558
         oggZajidzMfvFZ/ef/ccE1VvEEekPekVh8SGjIZSMMpXkGl7R7eNLClTs8P+uqsUxEvk
         NLjTtARdYOVkk1wk5rM7Gcz1ArgrWujatetxZTzLAFZ2aDx2SJ/OnSLmNwRlFkeWqPjO
         H2H6UEPzZty3sPGqzPL71CSZ2plnCU7GJI+oN2+F0g3rgxYtOQx8oE2lNvmoqSh21lUT
         y/jz+UwzVj42CP72sQ9uvIIL/QyGii0l+zDEXotHOMcmxSJrQre1hfVzipfLETdldWuD
         Nz2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXwjp1T4Z33x5bF4KMf6fbRYmeIMJ3Vl+T5Kjkfn+nm6o6oZ8JN
	plcTgfW8QGiXWSfk1EZa6K0=
X-Google-Smtp-Source: APXvYqz6GXv5mnBQjy0IJ/J0UZErJjFZtiNFXsc337Y2dGDZyeBu/JsHjo0WvRPvamVQ6IPLl26g7g==
X-Received: by 2002:a50:aeaf:: with SMTP id e44mr2201691edd.239.1561619210036;
        Thu, 27 Jun 2019 00:06:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:2cf:: with SMTP id b15ls1382367edx.3.gmail; Thu, 27
 Jun 2019 00:06:49 -0700 (PDT)
X-Received: by 2002:a50:e718:: with SMTP id a24mr2158877edn.91.1561619209351;
        Thu, 27 Jun 2019 00:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561619209; cv=none;
        d=google.com; s=arc-20160816;
        b=txE6G7BSe1Mg66WyBmoame6O+BL7oGvFKYv+RUwWKsxwc/hbbZwT/y87BIgUsSKFoG
         bVzvLkPtvlxi/wHz6ypIlWVB8i+FFCNvmv2fJ/d7zg7fB2MR6O25bdFXpW/yu1LGtjlL
         DQfZr7bonzQCGGEO+9UlP84fpeP4+6GPnY3I387mLbQxMCEEKgm6+/sqr34b/cLH47FB
         ZXnp1N5O52pwSGLT8pvzAD+wL6hkENdtMOE4a+2x3vmjbzIkxaCJxToEQQYHqtNL9bHA
         6rGLJqYFqsKC3y9d0z0rnkH3GZYCEdCMgxZYU3Gt1QYZC72snvc1ibq26fHrBoiKLf5Y
         zvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=3q42CC6wN5H9eXGThsvLJ3PaNJuLcpTzavglTEkX09s=;
        b=dTRyvjFiXv9mPICF1QyRGrsCCovFfXPv9kc1hcXy3CJBdlLNFr5kNBLcaE+pUrGjXf
         NxPcSE9DxpsG8v8s9r2YU1WL0NWXRxnmr3dNUSn93hrzROr5Xoota0VYZFehdZlUO4ZA
         B1CaWpnIvEu90g6xFLksXDlh3Oewfm4ExlpnvpE0ISqtIgcMqOmqQjUhwy7cHOawSWW0
         G72JNn/WlC1U8mZ6MygUHgtX3imktVyh15PzF+9azqk4LBjWTam0TT3W3BF8Od4lqf6d
         baZb0QbyI2OABe2o2Nwql0hzai2z5xuOZZcxUZLBOBIN8NAhqBjE1ASJR+OX2enf76xz
         DDrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id k51si79457edd.0.2019.06.27.00.06.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 00:06:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5R76mwX019167
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2019 09:06:49 +0200
Received: from [167.87.43.242] ([167.87.43.242])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5R76mWG003084;
	Thu, 27 Jun 2019 09:06:48 +0200
Subject: Re: Having trouble setting up a shared PCI device in root cell
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
Date: Thu, 27 Jun 2019 09:06:47 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
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

On 25.06.19 19:25, Ralf Ramsauer wrote:
> Hi,
>=20
> for the completeness sake: it's about ivshmem-net. The PCI device shows
> up in the root cell and can be discovered via lspci, but the driver
> fails while probing with
>=20
> [17061.414176] ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)
> [17061.420598] ivshmem-net 0000:00:01.0: invalid IVPosition -1

The register read-out failed. Maybe a mismatch between driver and Jailhouse=
=20
version: Which revisions are you using on both sides?

Jan

> [17061.426193] ivshmem-net: probe of 0000:00:01.0 failed with error -22
>=20
> AFAICT, the device is correctly set up in the system configuration.
>=20
> Thanks
>    Ralf
>=20
>=20
> On 6/25/19 6:07 PM, Mario Mintel wrote:
>> Hello,
>>
>>
>> I want to set up a shared PCI device in the root cell but got stuck in
>> the process.
>>
>>
>> I did the following:
>>
>> I=C2=A0reserved a memory region for IVSHMEM and referenced this region i=
n the
>> pci_devices.
>>
>> When checking lspci the device shows up but looking at the dmesg=C2=A0th=
e
>> probing of the driver failed.
>>
>>
>> I attached the configuration used, lspci of the device and the dmesg.
>>
>>
>> I hope you can help me what's going wrong here.
>>
>>
>> Thanks,
>>
>> Mario
>>
>> --=20
>> You received this message because you are subscribed to the Google
>> Groups "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send
>> an email to jailhouse-dev+unsubscribe@googlegroups.com
>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
>> To view this discussion on the web visit
>> https://groups.google.com/d/msgid/jailhouse-dev/525b5e1b82474f3eaaecf83b=
150aa9f7%40st.oth-regensburg.de
>> <https://groups.google.com/d/msgid/jailhouse-dev/525b5e1b82474f3eaaecf83=
b150aa9f7%40st.oth-regensburg.de?utm_medium=3Demail&utm_source=3Dfooter>.
>> For more options, visit https://groups.google.com/d/optout.
>=20


--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6417df53-38ef-d810-4e2e-9593c84aeaf8%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
