Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXMU5T7AKGQEGILRXUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3a.google.com (mail-vs1-xe3a.google.com [IPv6:2607:f8b0:4864:20::e3a])
	by mail.lfdr.de (Postfix) with ESMTPS id C35F22DCD01
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 08:35:58 +0100 (CET)
Received: by mail-vs1-xe3a.google.com with SMTP id y12sf4809418vsq.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 23:35:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608190557; cv=pass;
        d=google.com; s=arc-20160816;
        b=m+ACAaVrjIFTrVKQkUTyk3K1X3DBOtw0y0lb/LIMk//d6RwMOpTWedwQ+kPoA+Dy2M
         8i4XFz3MKC6NwWq6FKW/reYYwNe4QAY+TVXXN48kqPlwTuot71bEkb1Ciym0YIKhyDmB
         wQjIXqFWFXi5kOPhKCEKq/yj8Y0kti9chT/NVu2vvaPajh7QuSFWELq6GEOih6CL2Vfm
         J5Rz2DwOrbteYFvPebUxTEOuhvHgIP4lWHye4pj3KfBUJjtdldjgCaeo4y6WROONRD1o
         IEG/nC/0G9BDrQfWKU45hcfIacCu9LnXNu/Bi7wwuh6NSf/EBMDqWW4TCZgElngJwIRr
         sTbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=CN3cwd8ug1T/Pnjor4jNw1RdPfJJlR7XkOaNX2JzFwg=;
        b=J1++d8cfcqZ7imdXacBJjtQqdvu5S9Wys98Yyx+4x3CerXAmTmRU65cypLyUZIeY3j
         ZHv8NLdoWfXowWXiAENaR75cM+UO4Tk+xLkUyG42z4eOohRC3t/qS27YR/HNYOsf9XDQ
         OyOdcEz483UC6rNy9oT4gSPdu+8UaVYf5uiGJEwUJTQk5fs3/EIZLGvFw3cAK3Hl3FNO
         NK9apt/IUEjIHeV9SXWDInh+MvB9bAgP/S9lyXfeajB8lltLqhefX2VtZMGslr50bwcx
         uIbV18ebRH5MQXbdZLi6RDQmZdCx2kGgnR/K3L/zVR1jG6gtKhksqokrsdv8xvRjq1/u
         3Giw==
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
        bh=CN3cwd8ug1T/Pnjor4jNw1RdPfJJlR7XkOaNX2JzFwg=;
        b=ld3yhgzoXkSezNwgK6Q308ASDgMljAyV1kpEgpyYRZ4uqMX22F5DXwBzfJi0hpvLIz
         kGnIAJ4QoE1s0VXxZd9qpgJaaWGLb85zHyXK2tZpKQPgX7yHlKIxzVLtiIhxfe5sVY7f
         Od4tAO9lDmwhFVqEgPNPHYHkLyJok3l/KR+LbBQUmivqeAlGUXW3XudLK2L4sQcl/FFs
         sdlQ6UYnHloT8nz+UOD+hLa0XKk+y3tQB+4N4oVxGz3LMJXyfqvYVY0tCIk8U4wsAYjx
         si9ZyA8F10AqQhuTqsJ/y0cLT3mUrhmPotAYHR+0xBDqorSWhVKYdB3o0mrtCLetQEv3
         7Vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CN3cwd8ug1T/Pnjor4jNw1RdPfJJlR7XkOaNX2JzFwg=;
        b=TX8Pzr2LNpdtmUGmb51JMyYrI+3mGOI8cXXwzSMyrES90XDBI2fWwQqomeaW9NBNvC
         gcZQsoUY7jgZGRD+nflZcrKvLZa1PrH9FwpM3obAcSN49K3kE0jsvNL3qaJGINKeHv+a
         yELGYpHCMB9Q3+llOaVGb+Mn0hqnwDoGL6z7VzUbYuUnzj4ClOKEwBl5/l+u6fN44xzo
         6BJS/zDbg536OBYJn+yKApESIlw7mNj/pFZ5t/4jy5T2zGKBDRaWKKpYe8lvgfaXBUF3
         3LDKdI/Va20jqOjcRJBKoPyPiIvqR4V4EboEC3XWC+tQ/u4VjXsnsT7BkkUunv7gnLUS
         quEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531kj8b/TiE6jfg6sc+U30IZjaRhlD11wA43q3X4m8fCv0sVgaxd
	J3rtGgkwPRafkQH+Eh50fwE=
X-Google-Smtp-Source: ABdhPJxmwUCCF7SjcuqtS8xzpMLSFCxnp1FT/CKHBzIFKAbBV61qklq1BftHd5b9zM2g3yYg8j7DQA==
X-Received: by 2002:ab0:5e98:: with SMTP id y24mr34821838uag.108.1608190557652;
        Wed, 16 Dec 2020 23:35:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:681a:: with SMTP id z26ls1975738uar.3.gmail; Wed, 16 Dec
 2020 23:35:57 -0800 (PST)
X-Received: by 2002:ab0:146d:: with SMTP id c42mr27631669uae.56.1608190556990;
        Wed, 16 Dec 2020 23:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608190556; cv=none;
        d=google.com; s=arc-20160816;
        b=IkXFFIR2p1HykaT9HjTTGR1OHnwUAjrSCLQsItIaiKIK2LhRVt3a2m7Y/oXMVpiTGf
         ZOz8mrrlLszsAKfUgBOqb3l8jbUueDYgy/h1HCiQjaIj00Fh3mrQExONPqRxGOeJFwVy
         CRurEmTVC+C1rVFmh+9fbrsxWAOiJI4w00jpP+W3+ROeJXwZlSv4vHssm8QuplcbAzvl
         4GNd65OWP2D/f2Ptpq6dOx0p99S5JYGB2NTlWFnULF3pk3hcox99tTBequ0m2O1ve3Cc
         b6ORVnadeibTaNEVwJSwQ8121WkMLUr49ISHNr3/70QAQOCIqpqxPpY5CgrJ5NxcmaJo
         EizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=i8XAjWqotxjp5MUqDfTO1XsMfk49Q1LnB91oruZv5Rs=;
        b=rHTW84lsaaRxj03ejcy5sIW1Aw7SWxdnCO91O0H6bw6u/Uj26ucdkjkCdVdoUV4rwq
         mRX6AV9DDesNyr5N7s5aIGimnEN5hanuefGkoV4BaAhIUmPYyTuVVXkzXEGKc2HTabv6
         3xmj93xjy9T71UkKs3GaagkCBMmQzsnlHlPMuq48ORHD4q/1A9HOwugvfVSNw1+Nt9KF
         HHKntN7prYs4c5n6qew1d2PeW0U3GbiEx33M4Xnt4auxgaCQI9OYp2MVmhS42ZXEqx7U
         1MBbfIlkmkQhjXo4EB5QIa6RzGCA0+FJr5K5YZ2nJN8+dO4V1jCxRt7j4Gf961KuOGSz
         IUUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q22si447897vsn.2.2020.12.16.23.35.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2020 23:35:55 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0BH7ZstU005166
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Dec 2020 08:35:54 +0100
Received: from [167.87.38.225] ([167.87.38.225])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0BH7Zrgn000435;
	Thu, 17 Dec 2020 08:35:53 +0100
Subject: Re: Jailhouse Installation Feedback
To: Andrea Bastoni <andrea.bastoni@tum.de>,
        Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB6663A103382B6B698EB2B7EBB6CB0@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <200a59b2-8745-099a-4172-a29dcd22c65e@siemens.com>
 <64c38e90-8dc5-9b2e-804d-3a098825f7d8@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <41648862-80b5-adf0-570f-79397bd80435@siemens.com>
Date: Thu, 17 Dec 2020 08:35:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <64c38e90-8dc5-9b2e-804d-3a098825f7d8@tum.de>
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

On 16.12.20 19:55, Andrea Bastoni wrote:
> Hi,
>=20
> On 16/12/2020 14:34, Jan Kiszka wrote:
>> On 10.12.20 16:20, Bram Hooimeijer wrote:
>>> Dear Jailhouse community,
>>>
>>> Over the last days I have been trying to get Jailhouse running on real =
hardware. I ran into quite some issues, but managed to get it running event=
ually.=20
>>> For some issues, I was able to find a solution somewhere in the mailing=
 archives, but not for all of them. So I thought I'd share my experiences h=
ere for future references.=20
>>> There's also some solutions which are not entirely clear. If you have a=
ny reference on that it would be welcome, but I understand these might be v=
ery system specific as well.=20
>>>
>>> ** Installing Jailhouse **
>>> * Installing Jailhouse on generic Ubuntu (2.10) gives the following err=
or:=20
>>>> ERROR: modpost: "lapic_timer_period" [/data/ecseqm/jailhouse/510_sieme=
ns_jailhouse/driver/jailhouse.ko] undefined!
>>>> ERROR: modpost: "__get_vm_area_caller" [/data/ecseqm/jailhouse/510_sie=
mens_jailhouse/driver/jailhouse.ko] undefined!
>>>> ERROR: modpost: "ioremap_page_range" [/data/ecseqm/jailhouse/510_sieme=
ns_jailhouse/driver/jailhouse.ko] undefined!
>>> I believe some of the kernel symbols have been renamed in I believe 5.8=
. As a solution, I switched to 2.04 LTS (Kernel 5.4), where it installed wi=
thout issues.
>>>
>>
>> That used to work by luck for some kernels via ksymall, but that is
>> disabled in other kernels for security reasons - and now even removed
>> from upstream. You need some patches from the github.com/siemens/linux
>> jailhouse-enabling/5.4 queue (or queues/jailhouse for the head queue,
>> that's on git.kiszka.org).
>>
>>> ** Enabling Jailhouse
>>> * enabling a compiled sysconfig.cell results in:
>>>> JAILHOUSE_ENABLE: Invalid argument
>>> with dmesg listing:
>>>> jailhouse: Not a system configuration
>>> This issue was already reported on the mailing list, but I'd like to no=
te that it was not a singular case. Switching from GCC-9 to GCC-7 solved th=
e issue for me too. I guess GCC-9 takes the freedom to move the header away=
 from the initial memory location, which results in Jailhouse failing to ve=
rify the .cell to be a system configuration description.=20
>>>
>>
>> If that isn't solved in current next, we should address it. The proper
>> fix is moving away from gcc to a different way of compiling, but that's
>> another story.
>=20
> If it's the same issue that was reported in October ("Jailhouse in qemu a=
nd
> ubuntu"), then maybe the attached patch could help.
>=20

Likely. Could you send the patch as a regular one to the list? Bram,
could you test that and give feedback?

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
jailhouse-dev/41648862-80b5-adf0-570f-79397bd80435%40siemens.com.
