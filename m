Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOGO5LVAKGQEHJBFWRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7794192558
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 15:42:16 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id q45sf2130984eda.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 06:42:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566222136; cv=pass;
        d=google.com; s=arc-20160816;
        b=haTGWmV+M9+LYEYhv+/4MniI+7YlSodPaYQt9l6Tfu25lh79ef7LPkahZevRsXw+O+
         7hbWsvF9M+2tiFgXYCJO2eRF1EA74UKjWEXTBQ4xygW8sRb6Vy1tanrHJYeDtJh8oC9K
         e7P0NqAX2u3GCBc85k3UkEjiIna65cqoR7NIgkXRWFqCj0e8uwwZ4/+YlurcRdEmI1li
         BU/v20aIJq+CSHoE5RcqtC/YNAAf8SuSqqzq5ZYfLxZF2oz42bQ3I6oDJFDdr7IcI+4o
         64JkZjZrx7lEbISoNF5UjNiG1+wm+p0aTWLqcrPhdsldTLeIpJEzQ3A4Tb2dyIz6dx8D
         wLAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=1EpfWng5Jw7HweK8iCtGhy1M2b6qeuZuuQpVMsPsX5w=;
        b=VV4Ul+ZqbgKeKbAZburLYmFgqJv3yhgXm2QXbuPgbyTRrAUeRdgdx9ICQGhV3/vm3H
         ApL470/VIs6HG1GjZDLBzy16xEp7UqZVJYOVfkCMx8p/a7j4pfateY/kSX24dCw4UDSq
         dH+ggoPFk7OjU3mu3fuytVGG2/T7EdyLzTAhu8HknFMjD8f3hD36hfKrqj1LuiVYYJFs
         y0sdQZxXew51vDdxqz+SLbhckUZ+s5lfN7J15VVDkuiVqlfpeb63aSyL8WCUlw6M1CSS
         RSp6u9nNt/SU0GWB201N9/ND7iZOH4NQMIfccclVPhHVnn6IgDj+zldbLXitG3748hxq
         epAA==
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
        bh=1EpfWng5Jw7HweK8iCtGhy1M2b6qeuZuuQpVMsPsX5w=;
        b=Zsgwx+qdm4k6Cg/noC7t8mM/UZ0b8Tn84hdNYAxICfufPXb4/CceIDBCq21a8BmFgC
         HawsQONwRYoeGE9J7L3AVUUHqdtOKZZ7+3wlGrUKo+FEozcRFBznQKdjYux75TOymc79
         CzI0fhjwiZdzsd8ypHC2iViLLOcQfxpc282zcl1Z/kZlkHBOrdglO7ybSAgjUx2xFuSO
         QcoTGg+fwgwq6p1qUa+AXDZIyN92Yrw4F+w0TS+NNqvEUT3vm4207+xCbBlfj26LK/ej
         6TSQ5j7QhLEAblSZD3by5x5HTIW4HVbg+hm0awzM9Kml/wnNvDjqMuHG426Pse4ynDXD
         fazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1EpfWng5Jw7HweK8iCtGhy1M2b6qeuZuuQpVMsPsX5w=;
        b=cyGuZeLEOFXs54dcuK5GqbG1+iu5KFxKalSQNeyfuQQFiYxeeNhlJHGKQ1QRbvQMoh
         0DZSRMB3a64rpsiVnsFj1v7sOX52Xz2nbljyxueWeCjwtDu/ipMvIo4eIt1mnGIisIvr
         ADjPU4oyoRiyNxwFUirK4SVTjBqtucP+OCHUKOhm7Mk2QM/EjgX1ahqRspUk7A0GTmRp
         1l/xL/47s0ajWuutz5G8I5Wh5Z93PQLv/zdY2Wr1wWZXelRQ0eH1JMqymdK8a8MVsPeL
         XtGfdzzCFKvkvUAvU36ptOig6W/xuncZh/Gmkz2+Rsr9QJS3IoFi7cdee+2cchrcoN36
         NlZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUTDwMAfG4FaDNgEHaw5f7jO3jpTH2GxVGZp+oUGoo/DKGrI9Un
	/MLnYF43cC3DEmPD7Ew3+Ao=
X-Google-Smtp-Source: APXvYqwtLSTzjr/WcDtLaa9KO9649JvIO6u7EHwqA5wfiXADTNVzS97kyAc9FjD6bMhf7EHUH5Oakw==
X-Received: by 2002:a50:9fca:: with SMTP id c68mr24980595edf.246.1566222136173;
        Mon, 19 Aug 2019 06:42:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:19d2:: with SMTP id h18ls1710992ejd.8.gmail; Mon, 19
 Aug 2019 06:42:15 -0700 (PDT)
X-Received: by 2002:a17:906:8313:: with SMTP id j19mr21071985ejx.276.1566222135525;
        Mon, 19 Aug 2019 06:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566222135; cv=none;
        d=google.com; s=arc-20160816;
        b=A0QrhREbO0dVHNi/6aLfnCP3dZoOW4lSR1KdY9xWIWG91C5D2NNW+Ad9nCdxeT2k6L
         FaTh50D6AzuBe0DgP+QZ6VvOLviICa+1TUzm1LAfNBitJPB/LTEqDuFDjzmaDK9z42tB
         skcVVUV5kFbmBQ9KMy8RzzQazSMtNU8hjJOGuby2EvcdxK69traU2j5WHWcBklTbeczI
         ut3fKOlljXVpZ/d9KsTesMp3Z9aOgLdlbAsQ8OfUIBNYpfCNzEyaGt/grhANMxi3MC65
         F1Mshx9x7k8x89Ebfy8WUAwYQGJ+U1sU09X+40DAv6fh0HOW+GkcFOPu8JwTiYymKr+a
         nLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=//ADuxkBOswEhhn0guUkmon56+vLvbwcsMel0ftCZUA=;
        b=cmhGt8+g3zDNdvJbs1Qg7fDieEhOysczDy2D7TS1xX7EP3G6tvOAJbiNm/mjCGghQZ
         ufBlLd6QFVVTS8/gIQpR5k5Iv9tmVWZaC7guoFpVmwt9XoOYTD79ohPUlvIIHauh5ZsF
         MXQAA6Ov6wJ0cm9nY8iu6WhgCysEGPBTZeblpLz3QIjp4WK58Iw2z/d5I8p/DsET8NJO
         WnTIe1bNFLLvWDkEe/JdPLx9Q7vRgHBTR1hOt8hkncKaNummj43l51jV6Ly99DKNbcEX
         DV30348AsgbhBdr+mUEJMitkrgBlvukgAp1Q1kJPpuWzk9mrFkZd1fPCVz/WR3JKIB2p
         61tQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m16si954846edv.2.2019.08.19.06.42.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 06:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x7JDgElI011071
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2019 15:42:14 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7JDgEhs003537;
	Mon, 19 Aug 2019 15:42:14 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
 <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
 <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
 <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
 <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
 <6dfd2128-011a-420f-860f-4ccb472c079f@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <67cdfa4b-86e9-496a-3878-b5a0016b75c0@siemens.com>
Date: Mon, 19 Aug 2019 15:42:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6dfd2128-011a-420f-860f-4ccb472c079f@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 15.08.19 21:42, Jo=C3=A3o Reis wrote:
>  From what i understood about VETH, is that Linux root cell and Linux non=
-root=20
> cell will be linked, and each command i will issue to root cell will be=
=20
> forwarded to non-root cell, through that tunnel created by ivshmem-net, r=
ight?=20
> Doesn't that mean that the command will be executed in both cells?

The Linux ivshmem-net driver will provide you a virtual peer-to-peer Ethern=
et=20
link between two cells. If you configure those interfaces accordingly, you =
can=20
do whatever you like to do over that network, ssh, nfs, etc. There is no ma=
gic=20
involved.

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
jailhouse-dev/67cdfa4b-86e9-496a-3878-b5a0016b75c0%40siemens.com.
