Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMVSU73QKGQEZTDY2LA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id C63771FC93F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jun 2020 10:49:54 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id z11sf159635ljk.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jun 2020 01:49:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1592383794; cv=pass;
        d=google.com; s=arc-20160816;
        b=rlWQaO196WY+78Uecwm3JNwOG421BfwP4wgHj4yh/zq/5c8uj71s66Qk5ikKvzdwrj
         KLjN36TOebg/hsa96gVqGyGPzsaWHGtIhjk99dejHT6+QYt+VmA4rIw2D+t0/TbxnoA6
         6Y79+y4LfGR7A5awVqi2ZEnAyOcCWHJC0D/m7ed3cJfaZZysrD88A9gLWEf17RvR32U4
         7x7mk92JtdM/AS06Ptts6X0y0+FxT8o6tI8Z++n3TYglXHArGqLQ9lgvUF+cQjsXqmvO
         zM6uSWKoUpbJzeW8rFAntmrWGh5mV4q3KkFzchgTuz3plf4awNhNr8G5aAkK13T4xF2y
         oSXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=AmHeCzpX+PddZq9dF+FRyNpxEC3hfmQlBVBAns4vlFM=;
        b=gFMbR0nnZQNXGDqlKcCW3Q135vQ8DsRBjVhjjphn0lBNlHInMzpX2fhIY8j7ZDtv+9
         OVhQ4V6n3KDxYn3ve+uuWLge8eO7tajf+Vxs2gV9frQri+y2XfeBSOm0tzUr6GN6LLfu
         9HFUJUHIjptFmNNdTOO2hUIF+YehEvhhZeGF7fyXePPA6xmX1V9qd+HRTZuXJehYuiyK
         O+XpIuFJyHNjXF48SZz+YbM70WNIu+KBsxQmPG3T35ppX8qk5mFd4+QLMhrY/nTY/MbB
         ZZ2/1TNYBHGEb0T3tlaOjPY2q8JkdbZ9jp1ceoI+FtcfSblNktRgDPlkvDzphFfWOc8g
         W0DQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AmHeCzpX+PddZq9dF+FRyNpxEC3hfmQlBVBAns4vlFM=;
        b=JR1LJXP/QqFSSJLlCVrdHRIPRuVpDUkorZLDxbHxhET41/Q73Uapcsc2VixAz3xiLG
         wFRcZIZvbz4oHtDRMoH191EQe8l+XP+oqKjrU38gKAgEt4juRaOvv5ArjqXSzNZRxdzG
         ePCPI5tCaa7tUOnutAlEds6KuPWGIwCdVbp0bzvW5ukQshjD+a1PW1KBQLY38gBKEI6l
         tNWxLsH04JpBI3Woc1Z3BxWv3aO5vJwnJgby8va8UkXU4Tsdhu92/GNxOBJacvQNqrhL
         b14AZn6YgMAYNnizaICh2B/TV/w4vUSADm3BNURdXolzNAae9cjvl5T4DE18eAfA0FoN
         2kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AmHeCzpX+PddZq9dF+FRyNpxEC3hfmQlBVBAns4vlFM=;
        b=IW1rN6nxcmYvm/2MdUyjCqTsxb7UFgb8iSXJ+DtLcjL6zC7WPzDva8C9ndimB2sr6b
         sjmCYV5VO1GTXjt3WAY/37jLOGuqMkrIqQBuxWz6PoWuy2QUQftHILLKqSOb2PR104Gh
         8CVchTk/pXw53JaTuMhAW3KXjGIlXWALagxiN9qX+Ulq57FVCV3tjjylzUkCAtp4W6UA
         RV3F+BxxMSjby82tcSgFxQAA7VFY0GIDB00o7eGcGkRUyR2YmQoSzdopnOxjvvNeqI0j
         rMEbURzYSIYBFTN1OXLYynGjEY2IqF1SJw0xnydMatMgfe8+GLa6CmaGZLV4HaaI+UeX
         2Epg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530RH4D4D9vc51bGAnzeTio7ZCRmc7KOAIpZWEGqRrcpmge+gUoJ
	5KF6+CareYPjlIGpNG+yoe8=
X-Google-Smtp-Source: ABdhPJzSzil0VCsVAR9AHl1uSJQzethQme0A0wwzMO8wKjCdzoLsa88DPsOC1o7TGj6smXnweTVZiQ==
X-Received: by 2002:ac2:447a:: with SMTP id y26mr3899712lfl.146.1592383794285;
        Wed, 17 Jun 2020 01:49:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9597:: with SMTP id w23ls303797ljh.8.gmail; Wed, 17 Jun
 2020 01:49:53 -0700 (PDT)
X-Received: by 2002:a2e:7407:: with SMTP id p7mr3474778ljc.98.1592383793389;
        Wed, 17 Jun 2020 01:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592383793; cv=none;
        d=google.com; s=arc-20160816;
        b=H5AYftcPEyU80g3kS6wVFa9bz/kU5wR5N8VvGWSH5ystnG9IIC3vuzRIt+LmCFSrqv
         yhKax9qHlV3tQq1kaFjNqVSL2rEdTM60sfB0W/gvEtwMQt7PzQCKVpOz2EiOO03yvZkW
         +MoLm2YqtJR7is41LYGAuwnJ6XtOYjDDC+aasZcYK+Crb53R+wBcwEjn9Cp836nv1Vdq
         FROqDtXIuFe/ANjZsonUB+I+gOYdDL2VLkgavcRvhnPXJYfBEGe3TOw7EN6awAubkMkS
         45RF5KIDT6pbNM1g30ln0OpEM3rSW99TntHrYHVIuUdsWz/ddLdCAs531aqj27cWduC+
         0Q7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=wyz8EfkuJXeZPt8aIRYGGO9MMZmK4XQkNvdJHvQFnbs=;
        b=M1eL1GqCCt/nOPEn1W0hQEGC+5Oahl8hf489apSzmUvPOo9JFJ24sAyAH6AEfoVsG7
         kNgV8o91wmOm6Esvah09YxP3S68ZYtqYZbC4V0lH3kEvb+wt0189tJMM3AZ+YHqOCC7N
         c4r3xBUx/uvLHUbWV/P6LzwCYcZ4zde61MGzkECalPdi/uXM2DQjxWqZS/uJOyE/GqIF
         g3+ndLGRIW5VYBPebtUsqrtUtZpbgDTKHkd6yciPkF/3tIffY21s/gngJWMw1qRveXAW
         37oyoSFb2Cz1hZyT47nZr6WWBb0b5DthwJyuvIQW9dYkJOVBH4h4dzH0jbWuNkVq3UWN
         Eewg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id j19si588705lfe.2.2020.06.17.01.49.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jun 2020 01:49:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 05H8nqTm014294
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jun 2020 10:49:52 +0200
Received: from [167.87.243.20] ([167.87.243.20])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05H8npS1014246;
	Wed, 17 Jun 2020 10:49:52 +0200
Subject: Re: problem about enable jailhouse on rpi4
To: dd <497738387@qq.com>, jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <tencent_62A2790D0DC156ADD77061CB612F88C4FC09@qq.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1545fe3f-8629-8abe-efe5-60ab9c940b9c@siemens.com>
Date: Wed, 17 Jun 2020 10:49:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <tencent_62A2790D0DC156ADD77061CB612F88C4FC09@qq.com>
Content-Type: text/plain; charset="UTF-8"
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

On 16.06.20 05:50, dd wrote:
> Hello.
> I have met a problem when i enable jailhouse on rpi4.And i want to ask
> for advice.
> when i enable jailhouse using the rpi4 config file from jailhouse repo,
> it begin to initializing processors,but it crashes and the error message =
is:
>=20
> Initializing Jailhouse hypervisor v0.12 (59-g4ce7658d) on CPU 1
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/994, remap 0/131072
> Initializing processors:
> =C2=A0CPU 1...
> FATAL: Unhandled HYP exception: synchronous abort from EL2
> =C2=A0pc: 0000ffffc0203860=C2=A0=C2=A0 lr: 0000ffffc020384c spsr: 800003c=
9=C2=A0=C2=A0=C2=A0=C2=A0 EL2
> =C2=A0sp: 0000ffffc0222e40=C2=A0 esr: 00 1 0000000
> =C2=A0x0: 0000000084000000=C2=A0=C2=A0 x1: 0000000000000008=C2=A0=C2=A0 x=
2: 0000000080003580
> =C2=A0x3: 0000ffffc020e170=C2=A0=C2=A0 x4: 0000000000000014=C2=A0=C2=A0 x=
5: 0000000000000001
> =C2=A0x6: 0000000000000029=C2=A0=C2=A0 x7: 0000ffffc0219d30=C2=A0=C2=A0 x=
8: 000000000000002a
> =C2=A0x9: 0000000000000000=C2=A0 x10: 0000000000000000=C2=A0 x11: 0000000=
000000001
> x12: 0000000000000015=C2=A0 x13: 0000000000000001=C2=A0 x14: 0000ffffc021=
9000
> x15: 0000ffffc0015040=C2=A0 x16: 0000ffffc020d230=C2=A0 x17: ffffabc8c78e=
90c8
> x18: 0000000000000001=C2=A0 x19: 0000ffffc0222000=C2=A0 x20: 0000ffffc021=
9000
> x21: 0000ffffc0200000=C2=A0 x22: 0000ffffc0219000=C2=A0 x23: 000000000000=
0001
> x24: 0000000000000001=C2=A0 x25: 0000ffffc0222000=C2=A0 x26: 0000ffffc022=
3000
> x27: 0000ffffc020f000=C2=A0 x28: 0000ffffc0218000=C2=A0 x29: 0000ffffc022=
2e40
>=20
> Hypervisor stack before exception Stopping CPU 1 (Cell: "Raspberry-Pi4")
>=20
> could you give me some information or advice about it.

Are you trying jailhouse-images or as self-built configuration?

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
jailhouse-dev/1545fe3f-8629-8abe-efe5-60ab9c940b9c%40siemens.com.
