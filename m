Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGHNSP7AKGQELCSBROY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD92C85C0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 14:41:45 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id n18sf1068139wmk.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 05:41:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606743705; cv=pass;
        d=google.com; s=arc-20160816;
        b=MdPLAARMPXPY39gakofUsOVUsFothlW7dcpfEmJsbrnJ3XH5kqRvXej9YbVb1pZqNV
         FE9Ua41ARkbMkptQX1qlVTB53Re8esesYIlh+lqvg28WXluMNuDG0Z9XtggWhMzrkyU2
         golzWPdvTM2U5CwyNkANlzEI3Cds1KTwTBuCMQ2dAK0ANZeaXW2OZrp5K8Yl0Rjw7tnt
         TTi5zfyVJHbhnCkO0CNxuFFGINBmS2D2lGmZ+0guRJbm/L1nZ4MMh52FEcks4f/jBq/f
         A2qzlPiviT3JNksMjdwt/kVqqfZzfZBRIszAjXb1HkczWx0ec0Y78Ncho7XYM8eA44g5
         Ul9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=YnusPy7zXYnugDnuNY9ssluebqEAsJAO1QchNN56i7Q=;
        b=TOrTWakJauFCPBkPzwa48MDppep562Rfc0OE2xg8D0jSV8FUahp8pKh7UCkHipI50i
         CnwxkO6WXI5KtmHtjISyNSEmEEvXVJc6HsJgK4zreo+zNf7RI36WFfMBLSVJgypJhIN9
         4b0r231K7lPK7VGj+gCW92+cs8NPzr/4Q9btzDGJ967rA9n1ulWcVsEwCvXRAVOl2uGp
         nNYCsbiO3W3NSBodUibQ4XTlVbr0lFxhKFaKzN6cYRhscyY75Xze8zvGlOpA5byobSWQ
         8fdbwX8Yh0VeCB6rf/UjQtc9Hi7P5KHqSX3dUaWkaEm/PYCSrjmWofWe5/UYqVp1Htox
         9EVg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YnusPy7zXYnugDnuNY9ssluebqEAsJAO1QchNN56i7Q=;
        b=BwCzJ4VqH2XUcl0E2kEYsw9pIP3sIYLbaoJhaqpOL/Zvqm/Q6IZXZFUozKap/HRyGO
         /7lVA7ZrUp+bLEjpKP61hKAuOJkd5/f7dhrFwIO7H+RhRA0WpV0WQjISAAhB6gIo+Ln2
         V5FMK1vzs7yOiRnQmkQZQHPSF9g3gaJdgWBqx+uZs8pdJ/CFhFbCGZ7yx0sjvi98dKQS
         0Kf7G9U8AvQ0VzjIQw2MEtZfBugeMGBpr5+BQGTcCnuUDEZJ+xokkFcdILwg0MnCrBEe
         8lc5YcIsB1iK3sxmVPP8YAKWOnmJAztsqJl1IGoRpvsiGnBNQ+Lj7kDCqJQHKe6fW2LY
         2kQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YnusPy7zXYnugDnuNY9ssluebqEAsJAO1QchNN56i7Q=;
        b=kSD7U16nogkeJ1VDr0RvFhoUJ9O9szEX+s7K3w+WaYIlkh4s4gj4/mdbp8r2xGwuBv
         ZfO2YlV9paPn9IfD9J89SqTXdqYhIOCY3BlwRnDciV8PcjLA/dfbd1KjSULQWlMrFsFK
         G7JpChdxUjSQlpFy8NwVAppe9/FK3GwA+pmOBVuY3ZiEHQFE3HZNfG/0yV+ETcMWXRwS
         WUWPMbVzyHiLbPqadYYUTABc0yHSRLjZ77EhEm2AKPU3zrQsDJSCnby81g8x5X42IoSJ
         PBx8E5tp0xtNOVwAUrw3mRQzAIAIcXVi7XIpJ8UpK302rCtCkdZN1Rj/M7fRsXIkUBnW
         QVhw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+B9DmS6wd52SrDOu9fU+FcGZcw2E51YPCiy4MTi0WMK2JYylD
	y2h4i62YBjQCKVSScGhLpOU=
X-Google-Smtp-Source: ABdhPJxslP1i9lRkF51EQjUL2uFgSJ1Y02447uuHfez7bRj/Yyb1++Rsf5DnNEuzHeLR7i8CO3RCZg==
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr28808706wrr.222.1606743705213;
        Mon, 30 Nov 2020 05:41:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a4c2:: with SMTP id n185ls5957692wme.2.canary-gmail;
 Mon, 30 Nov 2020 05:41:44 -0800 (PST)
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr23224450wmh.58.1606743704171;
        Mon, 30 Nov 2020 05:41:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606743704; cv=none;
        d=google.com; s=arc-20160816;
        b=cKaEjBX4yuMMSn4lZUxStNGq4OY7iH4MdWPqnK1IvSAj6KU0/2mA94GMmP6y6bv0xp
         MK5FdNocS3qxpV2j3Qb5Hb8C39Ut88rqORflrS9p5LqPrS2rb2n/o/6tJW/ukpegaB26
         RekdtHsijR/uvsuItdOE3aX+ssrfTn+4RkCp/4QM1gyWe+I1yEsHqwadwXjlAeSuxgii
         sMRpCzkVl3RKSoClYw0Y77ysSpCR+gt1ZTUukUhJ6WjXIvLkqj4JH9qkzQymiQrB3MsC
         2h2hbuR/cQ8rkCDmk+YC0yDL0IceFe7++R266eMACseH9L+4y6ai0hOOsDvBAiMRwYyE
         n40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=YvODNZo6VYmJ703fJw9RGj6o0FxBunjHufmS65m8sEI=;
        b=kMqQ0pbXMtP/huxatT/2cTmwBVBVSzxwtk7QTQotNF46tQ6TXDaLisOHUp+Nu8OEFp
         ivtCRHq8NqvQMeiPwth7xePBItkQeipHBvTxuGRctiIFbMbQMpvTn5mA6Hv3eOgW3xLU
         H8HuZ2t48DPGfby7S+TOBSs5Wdh2va7ZK4Fy9OIjkXLu1s+tT96vldAxA3MOksGNrrz4
         7VQyfqojeRLuhbyynbgLpWl/CbyCenJW5zKwyg2+QxJGu4BcMQqVDR2bHcMhzCgTT2hf
         h5E7v0qvuRFzOzvaEDD5BCp1s+a7gjjkg0VZtSBNThpJ+QPpIr9fgIthGsqFykoImlwO
         0ysA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o85si129215wme.0.2020.11.30.05.41.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 05:41:44 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AUDfhRd023493
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Nov 2020 14:41:43 +0100
Received: from [167.87.39.132] ([167.87.39.132])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AUDfhPb002423;
	Mon, 30 Nov 2020 14:41:43 +0100
Subject: Re: jailhouse: request_mem_region failed for hypervisor memory
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR03MB71849151EBE032D778289555B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <b2243b44-31d8-5e2a-5080-6658b5d1ffe4@siemens.com>
 <PA4PR03MB718417E5C836D059FA4DC909B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <36eaf13d-b428-8cc9-45df-9386b7d82c23@siemens.com>
 <PA4PR03MB71845FD4327C041761649880B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6c87f9a0-417d-67ac-1cd0-e3120f5135b0@siemens.com>
Date: Mon, 30 Nov 2020 14:41:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <PA4PR03MB71845FD4327C041761649880B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 30.11.20 14:27, Sainz Markel wrote:
> I'm using a Qemu env with no bootloader, just a command to start the env =
copied from the jailhouse-images repository (start-qemu.sh). Any other idea=
?
>=20

Then debug your way of calling QEMU. The option you are looking for is
"-append".

Jan

> -----Mensaje original-----
> De: Jan Kiszka <jan.kiszka@siemens.com>=20
> Enviado el: lunes, 30 de noviembre de 2020 14:23
> Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
> Asunto: Re: jailhouse: request_mem_region failed for hypervisor memory
>=20
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open attachments unless you recognize the sender and know the=
 content is safe.
>=20
>=20
> On 30.11.20 14:00, Sainz Markel wrote:
>> No, the content on /proc/cmdline is what follows:
>>
>> / # more /proc/cmdline
>> console=3DttyS0
>=20
> Then you need to talk to your bootloader, that it eventually accepts your=
 command line extension.
>=20
> Jan
>=20
>>
>> -----Mensaje original-----
>> De: Jan Kiszka <jan.kiszka@siemens.com> Enviado el: lunes, 30 de=20
>> noviembre de 2020 13:32
>> Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
>> Asunto: Re: jailhouse: request_mem_region failed for hypervisor memory
>>
>> CAUTION: This email originated from outside of the organization. Do not =
click links or open attachments unless you recognize the sender and know th=
e content is safe.
>>
>>
>> On 30.11.20 11:31, Sainz Markel wrote:
>>> Hi all,
>>>
>>>
>>>
>>> After being able to compile all the elements, when I try to enable=20
>>> the cell, I get the following error:
>>>
>>>
>>>
>>> / # jailhouse enable root/jailhouse/configs/x86/sysconfig.cell
>>>
>>> [=C2=A0 142.758697] jailhouse: request_mem_region failed for hypervisor=
 memory.
>>>
>>> [=C2=A0 142.760507] jailhouse: Did you reserve the memory with "memmap=
=3D"=20
>>> or "mem=3D"?
>>>
>>> JAILHOUSE_ENABLE: Invalid argument
>>>
>>>
>>>
>>> I=E2=80=99ve appended to the kernel the line =E2=80=9Croot=3D/dev/sda i=
ntel_iommu=3Doff
>>> memmap=3D0x5200000\$0x3a000000 vga=3D0x305=E2=80=9D
>>>
>>
>> Does that show up without the "\" escape in /proc/cmdline?
>>
>> Jan
>>
>> --
>> Siemens AG, T RDA IOT
>> Corporate Competence Center Embedded Linux
>>
>=20
>=20
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>=20

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6c87f9a0-417d-67ac-1cd0-e3120f5135b0%40siemens.com.
