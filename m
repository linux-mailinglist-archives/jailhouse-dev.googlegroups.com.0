Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB47P53VAKGQEPCSALFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E0E95AA1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 11:05:55 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id w11sf6680759wru.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 02:05:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566291955; cv=pass;
        d=google.com; s=arc-20160816;
        b=yQ3iXT2zA23U2qB+KWKpkQvcRxEvE3BX5WnSs1T64XxQSIGGyS4Mak+3gWxSZR+lnD
         XWSzdNNRlIvEWOPvzGWwam2x3Mk/A9cbUze1XsKvIQEmPyIOMsPFZlbhg659EBZy/qH5
         Y7mjRAyLqlMIiEURRvUBr8qfVhabaOs/iYxW32/07wUYO6AHwyCtSSZab0Wm6p+ZiBJz
         +lVNvu/T8OqAHbwF57ZrxZ/2tUwB+ALKYDRvHb8UA2QdJrbMxXTboG717fQYJCmdFie0
         JTUn91REyrMBub/5n5AJv+yWLbf9l7KUrHFoREsd4st8x5U5mJ6NXd/a1yo12+jq/GuK
         oaIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=4v40PcwsMsuVTsPBtY+MUFIGKd9K+K1wzmeIHl8w33k=;
        b=mQtVAPK48fsSLUsCAntkMqmWdWJsF428xLvb4s68eq6oyXpfHLQLE1EsmeYY38KT6l
         SZqz0xSczNpENQuouQIm0qrEewI1Z0ODZmyiv03jjSaLzXqNKXnMvciCl9wBU6PyT8+N
         YQjyAWu1NnpDPOoEsMhVA5MqiPFASPcwk9evclSpe+g3H+WiPnUynbYhsDM/GwBZoMnl
         SMPuPbeDwIx5ExU4FYb1pqa9+6yuD5pEpYp6HTshUzeKC+s+jPTGdLRWhyj3R8FpUR+p
         rhCJ8qJOFjbBOWKo6ENaykHrx8i2Ipz9580WRsiNALiFrgEGLnDMFSb6pPsyKwIOFxJ1
         Z9QA==
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
        bh=4v40PcwsMsuVTsPBtY+MUFIGKd9K+K1wzmeIHl8w33k=;
        b=mdPGzeUjFPAf+JiKW7gfnzRSYVuP/Cm+feIS7hh4MdOC/cqMT6kKYxRQGVCa9tGej1
         mfSvnkM3aPU5YwVGPCxY2R4dYclls/BQwNbUHyq+vF+1ECS8+C2k9CgqB6CIt39c+LZ/
         h1lvhLv7DhibJRthYPkm2x/TfQMu5QIkAkzAIrIimbZhjGBFBfLpRWf+5HL1GP549w5A
         p0ak4uwkNwZE3FOLo4wfQI8s4J8MbFN0WzjE0HfS7djh8jDvuTQX2SjWU9kU2KrDnq6m
         fFD+qyJlG/qHqNluZ7MmH0cCKXDdLmFs7m4rVlbs4WZCC053rum043LxEN05a7PxIEG3
         mhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4v40PcwsMsuVTsPBtY+MUFIGKd9K+K1wzmeIHl8w33k=;
        b=Afq2DDZMB7ZxGPnhvLRmBWlkj7X3y3gl6K18oRE52Q+VUt04LNKoSwvkhs/LPwwkI7
         1T5VJ006a8JHN+ksvGTtbczZwO3bnC/os27w0nsnwbQt7EhWT2s4rR44o6sLyojVxxnU
         ImPwUfdIA7uufG5jl9FYIg5oolL9FUsYHPT5ZNXNYXSKeMQuHFkyNgHaMo2qKCLB5wA3
         p02ehhKI9dZf1vfKnnMiYOkihmWtZlnvFxfPcZ/5Mf5yBsXCPZ6lcfwXB/4QA+IFZlx6
         mnX/0Wy0xCT+taNiUQcTmBoqtZMFPuYJ8oS7v0CO+VB9W2XCbdS084qaT9i9AnQ0p1Q3
         N9Tw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVpkmADwOqa2fI2yz97jWD0U++SaLSwns/rA2EUPo1IbEUGOtdd
	dzcSSfaeA2zGP84BxJgd1OM=
X-Google-Smtp-Source: APXvYqyxbqdvkm4yRXg1JS4Te6//EKbKYtehoFiJqmtqlECRNIYDf9bXtfqF3+srW4/Phc7x58O71w==
X-Received: by 2002:adf:f507:: with SMTP id q7mr32799702wro.210.1566291955270;
        Tue, 20 Aug 2019 02:05:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4e0c:: with SMTP id g12ls705526wmh.4.gmail; Tue, 20 Aug
 2019 02:05:54 -0700 (PDT)
X-Received: by 2002:a1c:c742:: with SMTP id x63mr26133712wmf.0.1566291954577;
        Tue, 20 Aug 2019 02:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566291954; cv=none;
        d=google.com; s=arc-20160816;
        b=QC36lL6Vu5fphlaCQFYsh8perJeQ0LWeIMXNulrrJcyxPptQ9MDSacVaJnePqL1vVZ
         DoOof9SEGbKT3KFbmyGcDXS4M3WDRvT9WTqrF3j3lYEdtSDVP1iR79d56OL0I1VjISUs
         dEKkyq5o/p4AI63mByCAmkDoeJVUkjNZ49zJCw4IV4oweFDnkB4hlUckrK4/79Uj7jiv
         AtqwpNMXE6nb55CuxkaYlHr6xmpd6bMrc8tlSphSkSR9tj9Q23SuLF8vubtcdp5k1jc/
         Q3i2aybWV0p2KO+/3WrxZuQP/KaeqK8CHNxPtEPFbHrbqCgeAT2Ozm/3IUI17hB/9HjN
         1Xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=9YOsGkqTwOcht3bSraLishsVhgJX5zOXCqhJJJ2I3PI=;
        b=D7hJ0JF0wsltSMy+T5UNEicDetqXL/Y7SV/BVaaFuLOSUy4gND8ctMjnAjjfL8GnwZ
         2lkAJdzCEAmT/RfwTDOONMEyZ1LXI2gY09BdT2H7hYLDN13t8dGnCx4NF+3H3V6S9c8R
         aWf989pGN7i0nIfJ2PWEU2s8jPoMCyLC519z00C7xGRwRc71BGM9lJBN02XUKTGw3nPp
         a2FR7x0n6D0VbRs1q3PNUmCa/xUlovLoZGbth+0RT0hV5iTd9QI66ddpWEMfRyer6z3V
         3zbUAOZR7utMfLqWWlSDjNgkjNAcSGwygJem1qfPcHFbM3lm/+c0nsUkdOh7JfKNl+/k
         idfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id r13si963947wrn.3.2019.08.20.02.05.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 02:05:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x7K95rB0015394
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2019 11:05:54 +0200
Received: from [167.87.13.236] ([167.87.13.236])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7K95rq5022663;
	Tue, 20 Aug 2019 11:05:53 +0200
Subject: Re: [PATCH v2 2/4] configs: arm64: Add support for k3-j721-evm board
To: Nikhil Devshatwar <a0132237@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
 <1566224813-20129-3-git-send-email-nikhil.nd@ti.com>
 <05754d1d-ab11-a07d-ae5c-1c113e4b9fc6@ti.com>
 <41d5ff0b-a7c4-4fac-8694-c88d5b46f801@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3a668824-791b-4146-afc2-f30d66b5ecf2@siemens.com>
Date: Tue, 20 Aug 2019 11:05:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <41d5ff0b-a7c4-4fac-8694-c88d5b46f801@ti.com>
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

On 20.08.19 10:53, Nikhil Devshatwar wrote:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* RAM - reserved for hyper=
visor */ {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ph=
ys_start =3D 0x89fa00000,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vi=
rt_start =3D 0x89fa00000,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .si=
ze =3D 0x600000,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fl=
ags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>
>> Why do you need to map hypervisor memory here?
>=20
>=20
> Not sure. Do you need access to the Jailhouse memory after it has been en=
abled?
> If not, I can simply remove this

You don't, except for what the hypervisor already takes care of (it maps em=
pty=20
pages at that window).

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
jailhouse-dev/3a668824-791b-4146-afc2-f30d66b5ecf2%40siemens.com.
