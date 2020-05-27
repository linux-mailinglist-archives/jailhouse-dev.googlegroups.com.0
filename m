Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWP3XH3AKGQEWO2EJTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB71E4662
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 16:48:57 +0200 (CEST)
Received: by mail-ej1-x639.google.com with SMTP id pw1sf8994903ejb.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 07:48:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590590937; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZXRMghiU9QjhyeRZN2a07do4rClXLfPuEZvIrtzDRYc9HvpUFrjtSAde4nfFUwhrdl
         KkQXwc2D+vOY3LgLE/InUdsBlng2B+qCn8llcWL1im4FEMDcTU7ww0ow1L+p8WSgMdOj
         Yu5SkyfavMAJY5okwZevzEIvdsyXvlKXu0FF3v+qjbOhF83NKbOc+Ge0PN1ftX1Kj/wp
         vt2xeK8BgTaR3iO5V/H4uTpN6476wCHDINpDkWNHgalVFWJIYIMT4tTi7zDIkE55vxXw
         5YpgwSMDP5OQ2EjpYKj3zFfrI0Nu1Ww9+JLhlV9Cj/J/qyr3ePiyPVGtC51hKScBycWf
         Su+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=ugqFEhZoGckkjF1P6NuNX0BLnKqswWUO9txV1/bZd3g=;
        b=teN88mQFKPVi2x71cVbbhzfhXvjZooCfyIiIt6oeT9LvteJ8VDskG5+KVvbSQF1tT/
         ih6Jhzdp/ImnKnFjBD2nOyUSAxVbY7vpiNXEvGnU6MmVHvpjVsPrHkhZcrdjl4npCvrb
         8Ion5GN+4JJEOIpuzUSsXdlZ01LkKQSRBKt8oHUyB/xopiGS7vWr4u2j7nAeQ1TnnBCW
         OET6omdVqK1+uY4vxsGDYy9BBuEAT2nZZVN6RHbSFqofCyxg3KIcB+GS3duA/p1YuJP4
         0xpz6481IRwypIN2FMGU6NF+6VqJXs1rpr6nwEdK64mBQVUYrpM9eJYsr1+OoqpCo1DW
         4lSQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ugqFEhZoGckkjF1P6NuNX0BLnKqswWUO9txV1/bZd3g=;
        b=oYSioycsUF9S0upOPU/OwYiuUIA6SMNkQklTQ0jXdWqQGC/eH5ods6kXrmrtec9zQb
         DINUTO3J3IR02kKqrRle2/KyUObUvJq0Eh5O3aMtoRI2rSsWK+HCSc3SI8aPX+k0ye1p
         YtO+/wzgEYZsro8wiDOsnS4Pi6hPfmWCNGKHh7DP3wRWaK6GNDzo4cOTqjU/H92IRm/7
         hPhDkYKgg5GyaJKO7ync4Ya++jfuNjk2gLBpsT7nlfucJUXGT7HhUD17DoBI1lXIus9U
         Y5rMCgHf2gJGCAYtGkZtHneG2aRiwZAdH5vHt+wRpREwxUobgLyBJisNBjKKzHpOdf4P
         Gyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ugqFEhZoGckkjF1P6NuNX0BLnKqswWUO9txV1/bZd3g=;
        b=jehnCXs6a3onLrgxqRNS3aPs8qxWs3y6LUjSP27q0E2wuRByLNMeZhXtGtDbnuSnrG
         PBkdVNqgcqJF/W9HAbyrfjVXhoF61H45mxrWp+NFVjt/mhsYs+c9NcV8clVVRLSwr5tu
         Vo/f0dwm90vXVUv8lUR3B0J4aVZR/ipPMTQQfaa3AdiJ0HelrzbE5dUx8cB9Xf/2C2ht
         RjxxvEwggSmEgkZj4OeE9/LYvQdvZrQT+xy7IyL4v0NnnUesm6FcjJy6akjF0ANKtncd
         UMfgXz7CPML0SxnEvZ8dGDp8xcW1qq1f4YanqSPjAERg81BHHTd5yjD+Qi3fkHCjgWW7
         enrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532i5Z34IKSsEaGsFnvhKDmKnemRMkA9b6rXJB1rPpjGyTrfemjH
	a3An7BGZdzzCEY2RzxpowZU=
X-Google-Smtp-Source: ABdhPJx37roT72spZslT/aVwtY6gnp3JG1veZZn8KaybNNkiqFQvBsDdklNomAp8OVCnnzQFpn+swg==
X-Received: by 2002:a50:99c9:: with SMTP id n9mr19242771edb.1.1590590937291;
        Wed, 27 May 2020 07:48:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1004:: with SMTP id c4ls15320944edu.0.gmail; Wed,
 27 May 2020 07:48:56 -0700 (PDT)
X-Received: by 2002:aa7:c143:: with SMTP id r3mr7840777edp.203.1590590936497;
        Wed, 27 May 2020 07:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590590936; cv=none;
        d=google.com; s=arc-20160816;
        b=VD493Vzvwllco9DcXgAOVtK74YsxdBmOCNAqzKWL3w5//rtloCA7Rn1qa4CZmkSIBN
         ZwVuyI7NRgMkU72jDW2OAZseVhqOC2+6IHJ3KZXDzY7Mr6qWiT2X8veQbQpCanTiQXtg
         DfEhT1HUqZOjf4mJ/avUi0FstUyNNxGo7KOq0UxCTVpdBK94HOkFUnnv4s9s/1bMVZk2
         0l9C67Y21L9W+GA3r15z+uB98wOVsE6MW3ZX8YiBwY19WevqOjDGNYtOa52gW6bu0LVx
         xdatvaLAXmxhgDNVZbjnferZ8/7kz8SFJap634QSOuPm+XuS0yJNMq8Tq0IfMXUyUIB5
         ajEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=vQauQqtHg4RbzgjoCdO+5eqYuTfqMKjItr8zkfvs91Q=;
        b=LNrNSr3iJxko9MdsZ0fPgfD1O2/Bn3ac8LhT0DuWDYmSG1aghzIS+jUNO5gazOtTDr
         zLAkoKUdJmW/G+zzj6I7Jns9J/Bg3dL5QCIeOXXYrOEqGO0QiXLBioV4kYUw6dr+KqMw
         +EC3cz31Eb7MKYhSoSx9jyql5m3Tn3scCz/C8kq9aISxOmkuGSjUpZ56wepPLNHehqQo
         wv3idoTvZZHPeBFsAp6QaBIwWFNUJMMXkLH2qaOrRUn/sIgYbtrr8udkaUQf7b1npqBY
         Vnq8gyJzEsOGH1aJLOmQrbwirGRheNn/ECrbcM12CUYjt0XNTGfV/bq11ASrF17ZZZ6v
         TJ3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id u11si108759edy.0.2020.05.27.07.48.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 07:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 04REmtl3025634
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 16:48:56 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04REmtNK012004;
	Wed, 27 May 2020 16:48:55 +0200
Subject: Re: [PATCH v1 4/4] tools: ivshmem-demo: Pass peer_id command line
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-5-nikhil.nd@ti.com>
 <98bf4c5b-9812-d2d4-8da0-c887b44277b9@siemens.com>
 <eb224001-86c9-593d-b4ab-d0ae168fcbd8@ti.com>
 <1d841e18-8a4e-0c00-4a57-1a74bb461fe6@siemens.com>
 <c32c3837-b0d6-c48e-221a-4202923d945f@ti.com>
 <08222d8d-39d1-1514-2259-891f95f20697@siemens.com>
 <46dce81a-e841-4adf-7c81-5e6abbe8148c@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e75c66bb-048e-15d3-1a74-075829c9b2d4@siemens.com>
Date: Wed, 27 May 2020 16:48:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <46dce81a-e841-4adf-7c81-5e6abbe8148c@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 27.05.20 16:16, Nikhil Devshatwar wrote:
>=20
>=20
> On 27/05/20 7:38 pm, Jan Kiszka wrote:
>> On 27.05.20 15:53, Nikhil Devshatwar wrote:
>>>
>>>
>>> On 27/05/20 7:18 pm, Jan Kiszka wrote:
>>>> On 27.05.20 15:28, Nikhil Devshatwar wrote:
>>>>>
>>>>>
>>>>> On 27/05/20 6:41 pm, Jan Kiszka wrote:
>>>>>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>>
>>>>>>> Number of peers available on a platform is different.
>>>>>>> Do not hard code the target peer_id used for interrupt.
>>>>>>> Parse this from the command line argument.
>>>>>>>
>>>>>>> This de-couples the dependency between number of peers.
>>>>>>> ivshmem-demo can be run to communicate with desired target
>>>>>>
>>>>>> No command line, please. We can do (<ID> + 1) % <Maximum Peers> as
>>>>>> target. All that is accessible via the register interface. But
>>>>>> then all
>>>>>
>>>>>
>>>>> I believe, as of now, only root cell can communicate with peer1,
>>>>> peer2,
>>>>> etc. Non root cells cannot communicate with each other.
>>>>> Please correct me if I am wrong.
>>>>>
>>>>
>>>> Not all targets have been enabled for the "triangle" setup, but if you
>>>> look at qemu-arm64, e.g., you can see that pattern.
>>>>
>>>>> (id + 1)% max_num_peers=C2=A0=C2=A0=C2=A0=C2=A0 logic won't work for =
a 3peer scenario
>>>>> where
>>>>> root cell app(id=3D0) wants to communicate with baremetal(id=3D2)
>>>>> e.g. qemu-arm64 has these ids.
>>>>>
>>>>
>>>> Then we need to adjust that. It doesn't matter who sends whom, just
>>>> everyone should send something and everyone should receive something i=
n
>>>> the end.
>>>>
>>>
>>> In QEMU, root (id =3D 0) linux-demo(id =3D 1) and baremetal(id =3D 2)
>>>
>>> 0 should be able to to 1 and 2
>>> Here you should choose if you want to communicate with baremetal or
>>> linux-demo. There is no way this can be automatically figured out.
>>> That's why I added an argument.
>>
>> Every peer can talk to every other peer in those setups.
>=20
> Oh, that's new to know. Sorry about confusion.
>=20
>> It's just that
>> the demos are built in a way that each peer has a single notification
>> target, by convention, not by cell configuration.
>=20
> But if you can pass the id and communicate with any peer, that seems
> better than the limitation that root cell can communicate with only a
> certain peer that is described by how the ids are alloted in configs.
>=20

Not sure if I get the point already: If you link ivshmem devices by
using the same BDF, there will be no communication restrictions. The ID
allocation is static, to make it stable, but there is no semantic behind
the number. The only constraints: IDs must be unique (obviously) and
must be < than the configured maximum peers.

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
jailhouse-dev/e75c66bb-048e-15d3-1a74-075829c9b2d4%40siemens.com.
