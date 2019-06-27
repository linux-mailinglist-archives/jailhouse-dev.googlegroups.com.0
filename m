Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBLWK2LUAKGQE6KLH7UI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CBC58133
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jun 2019 13:14:55 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id 5sf1992052qki.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jun 2019 04:14:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561634094; cv=pass;
        d=google.com; s=arc-20160816;
        b=fil/EyoqhT+4dyHaerN4Hxv+zBMsg3IwDcw6Wxb5miMh9ytUT7xAPhP5OpiK3lA+TB
         4wmHL9sgl9dGt1qk/wGHHq6XHUTfjvVerUBX5ec8kmtJmo7VhGdImnwxQpn+DHyOw6b9
         4S3775CWexg39eRM3xRSzJW5ZjtjLXdpSSu5rSoP97cruYkEmMbgbk0p+Lwq8xwIsd6N
         ZpX7HRrE9yjzxCptLSNQnhq1AUHpZdrabtW18y6DtY6jaP9pd1MQlNe86lw/057YONpM
         iDdbM+cv0XOy6K7VyvLFgMG2tevnZAbMbQXHlkpxy7K6vlENnav8qv3gI/L5McQ0Np4m
         4zuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xTdfEdZVK8wfacG7n6IeZgV9j2S7IDG9En4WCFy+H3E=;
        b=YosN4YunHTkTyAHDNFY9XYDsNnP4ngO3e77OCSgRz6yh0Hrr7HkJex31bjWy6K1WZ9
         2twT7b3/KYNsMRS8QViyQdBil9ZTUB7dsqK0kuYexOJS3NpiRlb/YuTuuEGVKDU4ePNF
         JZzgTlf2m58AdvZlzOkc/ZiZVpc4HJLJ+KYuO+yWkywPQIJd2q6OUnnsb8H4MBFCdgFq
         tXrL5JC5sU1bjByFqT+NQYRf98OWjSxEQtsFja1ay2tNEvw6M6mzjniOF3NjlkWJGYzU
         hEKwoz5ff4/R/mGdySfrteNlQ+fYlOGhSW3XlDFFIP3DBqTiN1enbh01i3vp+AYQyYqG
         4V3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f80lr6cH;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xTdfEdZVK8wfacG7n6IeZgV9j2S7IDG9En4WCFy+H3E=;
        b=r6cKWyAYjjUhi6VYlGaLpE2hlKEgGbuXanqNzskljOUD9odAAon9JB2Q3mFHW7Byre
         lZVPXqA1FpTrqrrP1JbnUkaf8L7XuzJ4MS5dtbXkJ0RScy+Dg+fCZ3UYHFJi6Y6OOv9L
         jtOXcvA5alj/TjdASX27K4IaLTXzWFIOWcBnCoof/ImB/DO9zZr6neF/qLy0J3Rz6alw
         hTXj9xpLSeS+FvTfebRbzYCSvpCR1QqUKOtWWddUvFVEUkbG5AXeaN576omIvNH5mOLa
         fekL2WVfJq5b4Y5lod4ZMuvQnh22wpGZYccbx4FI5qwypGauNEctMNdJC5aiIv87D10h
         HSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xTdfEdZVK8wfacG7n6IeZgV9j2S7IDG9En4WCFy+H3E=;
        b=JXBf3QajIewcC+0Xf+pxulSjWCid6A+EaqKjjNDbVwPAlEsre7WIC/RUbW2ZCE/+jb
         o7owXtA7H7D39O3pnB7Hb/Oi9jXlyc3+XrfPRFKfPWwUytkjjs+poyMzdYc6uQzmW96p
         qu3MDN2cE0p695bh7xwjrBOnGb7/erfcmjJYqFB1CzYO5cgQDu6FcDLdnQ6eNrXY8GCa
         Sh25qMFyHpA5oKNLOUhS7Os9ZfaMbaeyBgTAvBDbidMaP4RuhVKBN4jz+4M/fGO07rBa
         BxPrJdQs7PsU9xFUsxX5bQT8Kh3JC0Jv3gkXRkPGVpm3bQKWXtm/3ccHzR/+7BssAJ56
         mvBA==
X-Gm-Message-State: APjAAAWGrAtHpZM0FQ9C+MdOz9rnJXE7zZZDNmrK8MBWFySnmq+TSyuB
	EBiwbX1/ytHcwXiya/87+0M=
X-Google-Smtp-Source: APXvYqwjZzGfKol00ZUYzmEb2h/Cd4EV7U9Qa4b1NmIooNoIRbZ2LiWOmCjTWS/77uHTwZ86+4cEig==
X-Received: by 2002:a37:9185:: with SMTP id t127mr2774959qkd.482.1561634094563;
        Thu, 27 Jun 2019 04:14:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:4897:: with SMTP id v145ls219730qka.5.gmail; Thu, 27 Jun
 2019 04:14:54 -0700 (PDT)
X-Received: by 2002:a37:5cc3:: with SMTP id q186mr2756442qkb.74.1561634094291;
        Thu, 27 Jun 2019 04:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561634094; cv=none;
        d=google.com; s=arc-20160816;
        b=XdYZ0ErTZgbQ0fW66WPSY+4X5NCM5Sk4XPQwSoaIVeC4mVF5zzi0w5ureU4rQ82jtc
         QCMpaxuWBRjzq/lo47Ud9WcN2mK+jftr0EALJdNJSQvjpxOc3rJjXS5qzJykxz2mRVwd
         UjYBCUyc/bCAE4GvUwPqveuZyQ1L+Qc3GLL8JpcrVGQtJrr9xamjRvjGXPuMSkKB+yHQ
         gaybUnhVJTg22RVZRbMizM8xpFhBwPf37O2R2ubr6CDjtkihhJjzneYB6Hz8EILmsouE
         5zuRraVqRRnekIn5AvgiCXIfofzdgzPfWrPnkeH2yi0xj5oK8I5Eol6n/EZi4xHbyHIo
         BcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=FchrbOMPqyuDN3wJxNWjERAeffXgVdKnP7X6Rk7qdso=;
        b=G1In+wxxWGGmZSZ2TbFxOpVZ/1vthcrdOOO3mfdjYLa2Lic/cuuTY84S4ab5uDpC4T
         iECmc3ftlom8fDAO2FtWsJ8RO1kq7Dqwig21ssYFj3vTq/9KUgp9g9mVPp8ybjB24mYN
         P6emkOSE5qnCHXuH3zVMrlPDeptYcvmH6sEVDXbsQISxZ2E2eBZfqMB84ngl6txXcJfj
         3ycEcDh+a2fw7X7gWGh6ncHJqOFITgC+xt8n+jVu3OmgbY2BKJTueEgRUSufivfiHlhC
         1/7YVK4fRsmdHgI1V25sapkGpH+uyZn5uCxPiNKW2XlwmsI2ZeLJfcmVnu0AjiYD+k8X
         GIyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f80lr6cH;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id r189si63904qkb.0.2019.06.27.04.14.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 04:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5RBErVV013785;
	Thu, 27 Jun 2019 06:14:53 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5RBErmi081621
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2019 06:14:53 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 27
 Jun 2019 06:14:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 27 Jun 2019 06:14:53 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5RBEr0Q009267;
	Thu, 27 Jun 2019 06:14:53 -0500
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
 <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
 <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
 <c724fb1e-4c24-8562-cc3b-bd35d45d098e@ti.com>
 <cb3304a1-b322-7f87-a67f-3c6f11fe3d7c@siemens.com>
 <b96fd4e8-686d-2df9-d4f3-32a2bc472630@ti.com>
 <dae8aa98-f7cd-d25f-b8d7-cb0006d08ff0@siemens.com>
 <f2210cae-3d9d-31e3-d587-6502c5863671@ti.com>
 <e46d5280-8add-4900-e084-dbc839fb2b05@ti.com>
 <828e6eff-d11c-7364-797f-623d4d41eb4f@siemens.com>
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <cceb2f75-8899-4544-7e4b-e21c8774ef4d@ti.com>
Date: Thu, 27 Jun 2019 07:11:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <828e6eff-d11c-7364-797f-623d4d41eb4f@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=f80lr6cH;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

On 06/27/2019 03:12 AM, Jan Kiszka wrote:
> On 26.06.19 20:06, 'Vitaly Andrianov' via Jailhouse wrote:
>> On 06/26/2019 07:38 AM, Vitaly Andrianov wrote:
>>> On 06/25/2019 11:50 AM, Jan Kiszka wrote:
>>>> On 24.06.19 23:44, 'Vitaly Andrianov' via Jailhouse wrote:
>>
>> [skip]
>>
>>>> Check - when in doubt via instrumenting the calls - if the regions at =
the faulting addresses are=20
>>>> actually mapped -> arch_map_memory_region.
>>>>
>>>
>>> arch_map_memory_region 0x48020000/0x48020000/0x00001000=C2=A0 0x0000009=
3
>>> arch_map_memory_region 0x48424000/0x48424000/0x00001000=C2=A0 0x0000009=
3
>>> arch_map_memory_region 0x48826000/0x48826000/0x00001000=C2=A0 0x0000009=
3
>>> arch_map_memory_region 0x4a000000/0x4a000000/0x00e00000=C2=A0 0x0000009=
3
>>> arch_map_memory_region 0xee000000/0x00000000/0x00800000=C2=A0 0x0000004=
7
>>> arch_map_memory_region 0x00000000/0x80000000/0x00001000=C2=A0 0x0000002=
3
>>> Created cell "AM57XX-EVM-timer8-demo"
>>> Page pool usage after cell creation: mem 62/4073, remap 6/131072
>>>
>>> Each region from the am57xx-evm-ti-app.c are mapped.
>>
>> Using the CCS debugger I started the inmate and paused it immediately on=
 inmate_main() entrance=20
>> and checked memory referenced by TTBR0 register.
>>
>> TTBR0 =3D 0x00017000
>=20
> Is that TTBR0_EL1 or EL2?
I think that is EL1 as the CPU in the SVC mode.

>=20
>>
>> 0x0000017000=C2=A0=C2=A0=C2=A0 00019003 00000000 00000000 00000000 0001A=
003 00000000 00000000 00000000
>>
>> Looks like only 2 last regions are mapped (application memory and commun=
ication regions)
>> None of the peripherals regions are mapped, or may be I don't see them.
>=20
> If we are talking about TTBR0_EL1: Since your old version, imates gained =
MMU support. That means you=20
> now need to map additional memory (beyond the first 2M or so) into the gu=
est's page table.

I'm not sure where I need to map this additional 2MB to. The DDR for the in=
mate is mapped to VA 0x0/=20
PA 0xee000000 size 8MB. Where do I need to add this 2MB?

Thanks,
-Vitaly

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cceb2f75-8899-4544-7e4b-e21c8774ef4d%40ti.com.
For more options, visit https://groups.google.com/d/optout.
