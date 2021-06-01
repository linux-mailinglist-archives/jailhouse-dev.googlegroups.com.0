Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK6N26CQMGQEJMVRWPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9D9396E34
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Jun 2021 09:50:04 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id m194-20020a2526cb0000b02905375d41acd7sf6294618ybm.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Jun 2021 00:50:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622533803; cv=pass;
        d=google.com; s=arc-20160816;
        b=C8U4xTGMzaLi9smRGfkm+bAQ9u0VRcdD/ELZ9cf7e4xNzWj0JSiMQaZP7QcMJ1Whnw
         l7al4lghiUPgxqrLzNDxIc+lZi4Ns4a4OlXrYFDgHV36S9Sk30GMZfhqB6+8sn2pzze1
         gXzKDUnwUg56aToEb+kOZDPGa99pTrTx4MCVDL3edPieqF5G5PYg8pC3/4JNdXMS16VV
         9GuUww4Nqm8pvbgLwhARqueFbTJexSFQEHDGI3hFktJXuU2UplFHl6sS0ROAZQnxgv82
         89/AJCixOLfsjbtXpyZfrgj+fROj8g1Qj4v5sp+fJUFPM9XGGpXb4JD0KReLkj26t7SY
         gQcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=e3IDmV/URUOdfe3cTe3n9gsquW8msEC/UBnGsvg2vyc=;
        b=BVKyLwN/iywPZVtvmiZF1SBiUSXIsSd9SGNZqEMWelsf92pA2MqsHpwVx+wYzPyFnU
         RgEMe9WRppNd8v1CUREWw+nGjMGgYNOOCEbAvuCW6uqat5lMAplGzp/A0MD1GDJZPMPX
         7wNWyYzABpcTpVB3fHFqdUyp3BYMrrPlWEvDN3J09fU4oomp2JpbLdA82s27nHSgk4C9
         /Z5FeV3Qbe2qTD0zh8noo8lg8J2nuZGYPdA9MSoZMr6k34VQPqdjHfiR4K1/a9iq3xzN
         P/gKlItb+5ILBfmygSpFmL6YXSXB5ogBwDSAf/I2df6PvPvGLLz8UOQvZ9+LkpCZ44xx
         5QaQ==
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
        bh=e3IDmV/URUOdfe3cTe3n9gsquW8msEC/UBnGsvg2vyc=;
        b=Ytu2enM6JgmZjJdCUyfLjmR6AjGc5NT+qw9ZebyH39g+hahS1HV9EX3OEmuhlFyUok
         XS4M7lCggzI+FsnZcuh5kcn2NIjKk5bW7VKlkzFVEeEkvvShrcdMpYUTBinOHAjRKUF/
         J8W13kN9PKlTdje4L8RQJr2axU5anNVfB3czMZgB1musvIh22p+FhySBz/LmnoRU/daS
         0504KJEVyQTBa5XZfN+L3CkCSvynrc09vGN7KNWmB7qjRcAO1dni+CQnCMCKqro/uDz5
         VoQXSzfnYSmtmWZ5LWfeWZAnZVkuF01hS8fh+mE785h7v9tgNcU7Ok+gd5GWtvzRsfBY
         zGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=e3IDmV/URUOdfe3cTe3n9gsquW8msEC/UBnGsvg2vyc=;
        b=SVKfRq5uqm7G9e6heHuDyAhR0ae1suDcr+gzcO4sfb61Hu92Qv0n4EBRcUBrujTdvq
         BL2ozhiNS1+maK29fPxQAmlByuKD96udODSYEdje+aBqAVCW7V+aGXlUHPrdACFoYQdp
         9259i7nESkqR7CUF1XgRXHcdvqkitdHjM3AbziYKLi0+ME/s0Cj5dQUr6SVgHOS0KIj5
         wtRvfdNj26DAB/vo6sQ5yx2Ql3OYObqWaFSiyNahO1nSzhNubfG2bkwj8Jzi2kGyXdLz
         uU3bakEi3YBRV49Pp+o4NX+Y3OBYgWvdkzNZEMtc5XgPxG7jPjKanxJ9kWNcXqOpC93b
         bFwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530XbUr6c7U7fa3L5YhjyX77yIOReeZ8u6582nisOivPL6u8feh9
	PbtpZVTWoq24IgeqCcQNaqg=
X-Google-Smtp-Source: ABdhPJyIUY2mfejVpcDlv5Xq/l8GdY5MVJNZ8dXCAKta9GIhLWKX7H/X8slNlDqKiSzY/mZHMVNheA==
X-Received: by 2002:a25:ed01:: with SMTP id k1mr19295135ybh.144.1622533803515;
        Tue, 01 Jun 2021 00:50:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5b:3c3:: with SMTP id t3ls7968986ybp.4.gmail; Tue, 01 Jun
 2021 00:50:03 -0700 (PDT)
X-Received: by 2002:a05:6902:1548:: with SMTP id r8mr7037750ybu.103.1622533802960;
        Tue, 01 Jun 2021 00:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622533802; cv=none;
        d=google.com; s=arc-20160816;
        b=UbvbKDUgwO5ixdebT87uf7LmK8G0EiRKNqXSBL0EDuUClMXEUcML+9qxLw08oJ7fBH
         lqspST1OMfSSAXfyYK5+/920IVkHGDE9+zuQg/6V7QnD6O/k/8C8ZDwbZx5MwJzejEcG
         2EOVPxP47CrBj2ig63psdvzkuceqVO8fJqsISaHlnMO7FzZu8QfBep9uO0nup1ZUk+LJ
         S7OkQRd6AWeYgemWqGVyLV1gZn4LutW4Nc4kWKD8JBIzddhX5sTLND9BPm5fVdi3BaCc
         WbhPEoYSPDHLbhGa/DCqzde6vEIlE/M2EB/UIn70zFo/A1YHoa96vYj68NdSHnUJ6ZXh
         IIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=WgR9+t0/zgrcH+61aP/sc8xjf9BbcJj/AcbTV32pfUc=;
        b=urMwZO5/wPuIg1qZrmuqghj84T5cjWVZIkNtB+bY1MmybYI1XuC7S6Onbgat2yiLfc
         fVGj42qYQcC6vU5EOrM5HDBw3GAF+8ixMRBzAOAQE64HEWnsVeFRcC8fE4ZhuZf1KsTm
         f04cqdC2M8hRZkwhPwpIEOkZH5hth/ies65ZmSVoeN0lmuyV03w0YUl81L9fDlsirV6J
         jrMSnwbnKtJ3wDzRTubFTlpf5bw/pOql5s6Pp+C8Fd9rwf+dJqdisXSBoOZIurYkPyx0
         lxG86BKWeeN8SoOvEzSNv3jMWRFAIW6lvoNGrO04kR6dNOHzcd7voIXLcJjD3Un8WOD0
         nRyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 2si709006ybc.5.2021.06.01.00.50.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 00:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 1517nwWU026969
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Jun 2021 09:49:59 +0200
Received: from [167.87.91.190] ([167.87.91.190])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1517gc6x017354;
	Tue, 1 Jun 2021 09:42:39 +0200
Subject: Re: Writing configuration files
To: Prashant Kalikotay <pkali@cimware.in>, jailhouse-dev@googlegroups.com
References: <989156a0-b5d6-7672-a109-9860c5f94867@cimware.in>
 <ce3b4401-63c8-bd97-64f0-8a14682f70ec@siemens.com>
 <914726a1-7178-321f-42fb-012ec241266a@cimware.in>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <90615fdb-97e3-a700-936b-9e348e859880@siemens.com>
Date: Tue, 1 Jun 2021 09:42:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <914726a1-7178-321f-42fb-012ec241266a@cimware.in>
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

On 01.06.21 09:32, Prashant Kalikotay wrote:
>=20
> On 31/05/21 10:16 PM, Jan Kiszka wrote:
>> On 28.05.21 14:10, Prashant Kalikotay wrote:
>>> Dear all,
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am=
 trying to write configuration files for the root and
>>> the non-root cells for an arm64 based system. I have checked the video
>>> https://youtu.be/7fiJbwmhnRw and also the pdf. I could just infer from
>>> these that I have to write the config files using the already existing
>>> ones eg: amd-seatle.c and other files. But what I am not able to
>>> understand is how do I come up with the different values in the config
>>> files as in other files.
>>>
>>> For Example:
>>>
>>> This is small portion of amd-seattle.c how do we come up with the value=
s
>>> in the mem_regions[] as 20, irqchips[] as 3, hypervisor_memory.
>> These a C-structures - the array sizes derive from the number of
>> elements we fill in below.
>>
>>> phys_start =3D 0x83e0000000, and all othe r values in the config files.
>>> Which document has been used. Any pointer to any of the documents of th=
e
>>> various config files listed in the configs would be a lot helpful.
>>>
>> Concepts should have been explained in the tutorial you cited, details
>> are unfortunately not specified. Therefore, you need to study existing
>> configs and translate that knowledge to your specific target.
>>
>> If you understand that partitioning concepts and mechanisms in
>> Jailhouse, doing so should be possible (you can always ask for concrete
>> details here). If not, even a detailed specification of the config
>> format would likely not help because you always have to apply that to
>> your concrete case, and the abstraction level of Jailhouse is fairly low=
.
>>
>> Jan
>>
> Thanks for your reply Jan,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 I am trying to write
> configuration file for a arm64 based system. My doubt is how to go about
> allocating memory regions for the root and non-root cells. How do I come
> up with these addresses
>=20
> phys_start =3D _/0x83e0000000 /_.=20
>=20

Memory regions describe portions of the physical address space, mapped
into a cell (guest).

For the root cell, study how the real system looks like (device tree,
/proc/iomem of a booted Linus). On x86, the latter is what "jailhouse
config create" does as well. For other archs, we are lacking comparable
support, but the task is often simpler.

If you want to hand out a certain amount of RAM to a non-root cell, you
need to

 - make sure that the root cell does not use that (mem=3D... or device
   tree reservation)
 - define a memory region in the non-root cell config with the
   corresponding phys_start and size values
 - decide whether to map it 1:1 (virt_start =3D=3D phys_start) or to make i=
t
   appear in the cell at a different address
 - tell the cell where to find it (e.g. via device tree -> jailhouse
   cell linux ... will do that on startup)

HTH,
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
jailhouse-dev/90615fdb-97e3-a700-936b-9e348e859880%40siemens.com.
