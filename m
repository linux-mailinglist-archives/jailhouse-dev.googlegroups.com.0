Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU5Z3H4QKGQERMNJBXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3C524473D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 11:43:48 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id o201sf1908225lfa.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 02:43:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597398228; cv=pass;
        d=google.com; s=arc-20160816;
        b=OKpEAmioRHLap4a78Dm7y2aL/O3rI7y6o1hlNEntvy7ZgZ0iNzXfau5LetLw5OKsTS
         2rtsk3LfVSJzdfVBBozG1LuITt8bTnrjYHmwtccaDOgYUGJGjoc997syq4zbwaCQsjNC
         7tik/9BgLirmrx+7UwjgCnVDPyT0xtgM4hNrqq0Hh2cehdwtlJ2YXf31nfgia2089Jya
         RnoVKrJrpEwqNZexNps3W2xX7D3PmT10YTxIUHIHEMwNmThvcZIsLsS8KOLwY5x4Uabi
         XkFNCzZk1DaMySZR/5K0TziYybOsbXYLvTIxADxsIqnTnd2pedqOTkPcPjvrhwn+ye22
         mlXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=/U6VdhalDrC/2Fm5CFmeAoz32YdGrpNSel2ln/cZdb8=;
        b=d50rapoYru8wbg0INpMdQPyyrYwyfqzg1OTlqCUWwZDkDCXStbgSjEaj1H1zOiD+o4
         EMGrHWJUc269VGU2sEEtVL45JMcQrX6Y+qQPb8/QEimzwiBU0scqFpyM/p9vzTfF50mU
         9Y1YoanTo5zBOYdrZCp63IFmSDJ0OjFFMDdaj5TfKF0oOWa7FpQGIPylhD+sroWUv3a6
         7/UDoLjtOAxoT1TCyiTxcerVvjd+R1uPRJnzrqs2zwZTaCro05JODdcMEOA6OskYxo9G
         tSseFLI7+8J59Ck8s/BInNVAMuCYkNXppb1yhS0eJPuoykFKx5eA7m0EnutZDZyOiNI5
         r4Jw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/U6VdhalDrC/2Fm5CFmeAoz32YdGrpNSel2ln/cZdb8=;
        b=bKtN+Ry40zTckgLox2GtQhsj+Ci136c511I4NhlehGq210ae5cdv2U9mAn2fOoo5S2
         kSLZBo3tf8Awp9sZ0rKhey/EMXBo6kGBuVX88uU0hYoZ0b4NsrwFMfNJ1dVkmMZU0wMz
         6dW/+H6SxQ2+jMtUtcbfh672JOE2+tS+MIyMFuP+HBbZGDFgiFdMX0BTMJhyCNzY/QpN
         LaWmeTSY6UucIwshKQ3eK8wxVrjIREOm/YWsL/90p3GV5M/eiO/McCQSZkAWYYuFYkh1
         FzRjG3n1AiMM3bepDLevjhu8WeJ05spxqI26ohji6l3u3xqWjzParJASkfs17qog7q9s
         nSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/U6VdhalDrC/2Fm5CFmeAoz32YdGrpNSel2ln/cZdb8=;
        b=rhCI3Bb6B4BhK1A98na8ulQbT9bpcID+uYuUP375GYqW4f+8ZnpRaljy10F3Uwl/2V
         jl/+LdwA+gIUpjrYwiunGBn3ZJY8RRsK/ZtixhHeClun8at7EH0sl7wWon1ji4OfvRdG
         +EPq/cG3jlryw7qf4AgpQOXbGvjSg3KaVDgH0GltXpIE49S0nKHapRJve6+apXJwAd8J
         thjU/AA+qcK4KF002nP6umMNTUCByGJpxJ+MhMDgTJDPEpFKwAfr0C7ZpCZD3BoQogd5
         lEuYEamrA/CSTqpdyU0Y2K40c/nsBIP6e0HBWwz7XpsvfOKHNnrOl1dGY8lYGxfHukUG
         URfg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53050vC2Hh1oX0JC1skLkgWQ+lxEszvqI8PAd3WvGz+AdNdQYNWN
	wbIzV9N2enRz0VCjrftgxn8=
X-Google-Smtp-Source: ABdhPJyYwsXumR7YujqiHFsghV8SsRiX0+A9uf1F16zO/nc6atHKKgwRF8pvKbOYzlilA2q1RxuClg==
X-Received: by 2002:a19:983:: with SMTP id 125mr861464lfj.129.1597398227947;
        Fri, 14 Aug 2020 02:43:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4845:: with SMTP id 5ls880147lfy.2.gmail; Fri, 14 Aug
 2020 02:43:47 -0700 (PDT)
X-Received: by 2002:ac2:4542:: with SMTP id j2mr846835lfm.110.1597398226998;
        Fri, 14 Aug 2020 02:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597398226; cv=none;
        d=google.com; s=arc-20160816;
        b=EyheCX8fRV5T/ZxSMEuGEiBwpb5N7X7e/KOiHBeLDZgomeE3HbfxK8dyavgEY3mC9T
         GJBZ3xMwm3yrHeIbtDSkBpgBlnqfeXu8aGvaZFHJk4riKc4Ycu/gfHMQFUGHkNr6jZ5B
         zCvWRiJTbBCp/jmJd63lMA0n6s3qsRz+P10RyMRvVO8Sod7fIzVPsTsDGn1nz3DCUSSn
         tSQAYCAS2WTHRemDeX14XSCo7WZd/NtD49tFg2afMweZGaxTIMTWUYVKgiQprc+3Ydmh
         Kr5zvZNSg+PLWBXSFei6HE2LUDqhg9wSs46mTf2W6tHzsRuTbjNb0S6gpvXA6IplgwRA
         GQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=/3Nf+D45hE7Np46jIbdRYsjtlOZyonu/dl45atVK8r8=;
        b=G0DZc7babG2DbIeO9YO+jcn+ZolO407dIAh02MdIcFAvXdVyHXntZ+rm2cYqIgtY1q
         9QdC3PsjrNP/NQ8McUpUOHKdnBNBKt0m5Ip9fCbOjV/IcxylnedZwhNnQb4c6XRISnSJ
         I66kLW7mfm9IPRkR+T7ZBS1HtuxsNwoZf47EQs8bnsd4wUQ/q7byejI98coZpEuARTOK
         O/iVmEhzHQfAm77JLD8zdLaU6GczJZJn1xWjTBKTptl4c/C56+r1f0Gbb+s0mnajlCCE
         H129kfcsFoNOXgq80n2/oNuPraMMbvR0t3II04pTEDHLQ/VMieeMUGHGmmxCPxEgql0O
         WdHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id f16si262367ljk.5.2020.08.14.02.43.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 02:43:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07E9hkpv023846
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2020 11:43:46 +0200
Received: from [167.87.75.232] ([167.87.75.232])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07E9hjd3025680;
	Fri, 14 Aug 2020 11:43:45 +0200
Subject: Re: [PATCH 06/10] Add libbaremetal
To: Peng Fan <peng.fan@nxp.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
Date: Fri, 14 Aug 2020 11:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 14.08.20 11:08, Peng Fan wrote:
>> Subject: Re: [PATCH 06/10] Add libbaremetal
>>
>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> Add libbaremetal for sharing code between inmates and jailhouse
>>> baremetal loader.
>>>
>>> The Makefile code is copied from inmates, currently only string.c is
>>> moved from inmates to libbaremetal. In future, we might need to share
>>> uart/mmu and etc.
>>
>> Might quickly become confusing to have two libs. What prevents renaming
>> inmates/lib completely into libbaremetal? Sure, there are some jailhouse
>> specifics in inmates/lib, but those could likely be put in some corner.
>=20
> How about rename inmates to baremetal?
> And add bootloader stuff under baremetal?

We could do

baremetal
=E2=94=9C=E2=94=80=E2=94=80 demo-inmates
=E2=94=9C=E2=94=80=E2=94=80 lib
=E2=94=9C=E2=94=80=E2=94=80 tests
=E2=94=94=E2=94=80=E2=94=80 tools

and put the jailhouse loader under tools. Inmates is a "brand" in=20
Jailhouse context, so it should remain in some form. But it's true, some=20
of the existing demo inmates can already run without jailhouse.

Ralf, what do you think?

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/deb41f1a-1b87-ebd1-50d2-d7d299d35d8e%40siemens.com.
