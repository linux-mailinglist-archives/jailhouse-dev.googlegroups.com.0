Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBR63YH5QKGQEWD3XMHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731027A085
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 12:47:36 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id a2sf3387150wrp.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 03:47:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601203656; cv=pass;
        d=google.com; s=arc-20160816;
        b=ihSVShmrWQVd6TdLqEanWv67eO7JHJaNpcwKjJUC1YVgqPCBhgs0SzzJElhdqBLHTW
         lTFw9FyTfnOCSw7oHraDYB33zMrpJL2aJRILHipkRP+Bc7WhQw9bWTfGcjKuLOD8nomF
         pd7ynDmAgVqSK2fGZaB0hbz0zOe65I4+4w7ccakkocpZ1wT2fpNLrxuJSQ3GdBD6g/FZ
         lWAz4RIwRvDietebrzYEmcva8Css95BrGtMPsxTtsKe6qs6lN1YQodMaDLKdI83ltJ8B
         Wa5vBip0pJDKWzyvuznAWtJYeglEI181A3QUbfpTCsPo+7iGgGjWqzcHjj235dfD0/uI
         ynOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=UR2TJndyVLAHU/bJhHEc4OJaAw7mMNyJlhXzHtSIoPo=;
        b=FaYyv7r2lCXtl/tpCghkqlFvCj35I8Rd4PDE2gta+Q7hTEMVYfQEF6JKTP/H2x1XAZ
         kElRsCaK7H4KwWLYaaxipghf3Yh4OkpCU4BLfsqDkGxhfS7NvXmqJUvwJym142noWBr1
         SxvfjBodLW2Y94G6VohSDfmkZexEkOPDv4sEWf9JNkDbdW+IAqmGehg55cN1smGKn23u
         efjWh9EM3VDCZlivPlOAiAFldA8bjIPF406LKwbWunAk7HVhn28IZ+JaSFC6aSZljo41
         4C5pB6srmpOe+9ACfUqTjPS+1k3yJSIUR3OHr5LZLm7XBQ9PSz79viQq1O31iK0GDjXi
         LpfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="qKf/Mw5e";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UR2TJndyVLAHU/bJhHEc4OJaAw7mMNyJlhXzHtSIoPo=;
        b=flwyCBidDUJWnxxaPBH7ULkQPFtmfDKFWzZMrcXHVhuId4xOeBX6azU0hFb0ZMX7Aj
         dJjDzozrD9/UQWqYRfk6Wbrr++tAykCejbcun3g0/LdV1ZBNz+gS78R/wJ+zRPgBO4hM
         TC5s4jIIh20EJAmWwWQpad8L/ozqLZ3feHayr/gTvDKWujjvF4khyCQ5f4/ZqFPdp9PS
         n96IH2nuZ3qo+Eft39oxhZCuEsVxViDHTl+6QGIdTQRloV3U2V0375CrdE7hRMQELa8q
         LbuH3rpxR48d5Ox7x87Mrnbe2fR1kh8nV98cAMD4hXiG06fwhhEqf7QuytwgYet/9K5Q
         csCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UR2TJndyVLAHU/bJhHEc4OJaAw7mMNyJlhXzHtSIoPo=;
        b=lTmo9H8z/P2fHOsZBGxbZGhE8Nn8bbuG2+TeBjFDLUeqroVpBVtwXi8oMBLvxClHoR
         TT1LxVNAu5rMkm4j8/BZq82NclgWL3Dc3wKXX/hOTmsYqNNog0kmc99fXKv/cHEsFsW4
         Rrn30F+I9tPQLK0sX6xdXge7SBL6dWL3j7r1W/Ou4kilSdA5G7JVtlwvfmKqFi+cvBXH
         EoswIEdHgtEjWAdHhGrhSog2RAOSadTKmo4MMvHpDJkSIhehARhUGy9DgvHRHCHJwJjY
         X1Bnjik/MYetPQE8tZ67iVgBNQG5YKibxiYUIE8xnCU0VGmsphF6K6csKi1BjlKC7nck
         29Ng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530vGbilwnLAuCy6B0ljcWue4jlHl+8M3d7LEyR9jB1SExqzgMjc
	+uIWMAuGP3Sq0W+FIvAETKM=
X-Google-Smtp-Source: ABdhPJwR5hNyOpYgCtDAkNpkYwcLmSuIgFnrhPk9VSFv0m/2kOpInAbl4XV3+VpHLHZw8TaHg/rd4A==
X-Received: by 2002:a5d:60c6:: with SMTP id x6mr14775620wrt.157.1601203656226;
        Sun, 27 Sep 2020 03:47:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls5898872wrq.0.gmail; Sun, 27 Sep
 2020 03:47:35 -0700 (PDT)
X-Received: by 2002:adf:f552:: with SMTP id j18mr14331414wrp.128.1601203655051;
        Sun, 27 Sep 2020 03:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601203655; cv=none;
        d=google.com; s=arc-20160816;
        b=dx27gVL6j2L1ljvwM4iUop7XgBCGdXkaFrLPaHbnahcflVqpGopDQ7NbUaZBCWWSZ0
         UBxxPG4YZG+HHWmlGnBqOqWzLMxUiIF3QaXiGXExvGNCwe6646RjMKo9cD1wPwsgDqwu
         ymhfpeZFzkfTKDqJv4B3TJKvk6w6e9M4LovdMh3W6jf/xdxcXcNX7n775WSYubF4lVYY
         CrNsVVJ8UB4P90WSeKDLPmtAi67159bFZRUlzMeegC/LLGAdwf9RMDc4DGV9QtaDWfBL
         30Yfo+b+AWfxICFptrJs+mer7mD4CjrugRqoUGVOzyHIysEICHzXQBfGVyHo03kwu9sd
         XoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=iQ4KHKoVHBcLbYAa1nSDUrFaZybIlFDgwR8nyJ/eG6s=;
        b=pby+U1X6Ksr0jfcGP+rlHQnu8fExIAcjoenSi+Ic0O/JwGbPCzbR5YxsoIkH0MUkHJ
         F5B+6Me8/jqmnJ2QSFXG5EwVijZyEqpSgPGTcZSJV95l4VT/IkSvyd1R1uNXwvwTt/1l
         L8wFExDiQUq3MBs3DMnTbc4yxq6v2PfaXy74zL+AYrZsX6qqPrrjZk2jjMnbKUunK5ux
         TDPti0Waeal7AyV9FfdxL180LZ9cVgn6hekg+roBbyml78v1ve3zeSjnF6NR8poYt4SD
         Hcb38MNRzqZcfi1hTFxGUyOMDGeuismok4Ee0jKKUGqukpLk0JeQqIzpihM6/7eg4FpK
         xRyg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="qKf/Mw5e";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id z17si97716wrm.2.2020.09.27.03.47.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 03:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LwqBg-1kT8182XEW-016QCQ; Sun, 27
 Sep 2020 12:47:34 +0200
Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
To: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
 <DB6PR0402MB2760ADEA2D5A37133E5A1D9388360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <27f73d85-f64c-fa29-0524-1fa360c6385a@siemens.com>
 <88609d72-f571-ad84-78ed-28fcec0198e0@siemens.com>
 <DB6PR0402MB2760EF8A41AFC17F8571BB5B88340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <143f5a37-9cdc-d2ef-581e-7f7144b6a709@web.de>
Date: Sun, 27 Sep 2020 12:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760EF8A41AFC17F8571BB5B88340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/53e6wBq4Bhp1vwTeWydCDGNIYC38p6VDEgNcGod4aWylZgQJVx
 JUtMhhKeeeLZLhXwU4ndFZfDeks3jSkB91lzNs0mocpiJHM/aL4vBjYIry2i3Edyc8biViO
 XmAa1FZu/SjG2jSht7C7Fj9RTxhvpAGQngrMPV0vM42IdpV4aqriAeIg97cVds3mfCjvu3D
 KTbMyv1YFmnDS+1d6XZiQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ff6yB2ZHsjo=:lFAPrBWK3jL0auGs1ib/b4
 0qtXFgCn7dsmD+zr/CgywKXpIiE4opjSDTk1jiZRRw4wlHw9kIKTQoVSwkcaYFnRG6CSij9CV
 kE7LoMv0nsh1D+KNrJa/JlwWUklyoSanm2ZiQX/j4nmxzNjQsP+zP5UbJJIPr5BCIePQmsSq1
 i4gylYFSKI+zCqcPuL8IAVfK98WVqln6P5UIbEhFaGF9RJycCQRm+VwLQCHMMxWkXm3lZjhGf
 qAlPi7w4ZtLGjA4TjuuD3VKVh8qt+VNZ723Dgsv+Iu8OBUnjp5nWKRNQqP//+MK596fgb/Yqn
 g4f5dWXE/tBHAsVb3iRj+8uRgFG17YpbWCBSCw2CK7wDW+Od/sALknqwBcna3fNK1Uauv43FH
 P2xYeUfHCEx83S/ENhxXdckSCSZImoWbm0Jjx0l6Idsl/bzuH5NzQzVhftqBinb8W/Qy+SK2Q
 JBNo4Yr99Wx3P56tUAldN3y7PzbbuXwCqXcXnLg93IDNa6o2wfCULgjDa1+ZRpxIcxZchX/y8
 JLerUVcCnvRDsFHrjX8BJIHEXjaLa9aFbnSAWUCkPcIkvAho2DIVdWavkIdmliHp0QxJpQRM6
 GWdyAop++dX51IO2eWv9oRbN/nDWQcb6kv26YwzUWaostKWeKgZK/zVSoHPuGn6HNJpSwXJBq
 wnovBUM6IXjreWBatd/jQt0WgNOY3Hj2EPex23tSWe8xyCvmi05/Mxbv+gFl5MVmdhIWLC7eO
 wOy4necYFzaH8go+tLKK4MjK7zABNA1tPrTpP59K0Lb547YXlubJClz5PTicXxG76SkNehnLa
 BQ88OFTu3XtPXAaIZ7ao9pM7F2x+BESlHkCZajssUEFsTQagPJbpaPz8Tg0oU06iNLEV8kSwv
 ktGumSVpf6AUwI7DcIfpYxofeNW/MDtt68tKTTDmhG1JZYeKhWxe1SfOWJs2vMxlKv6149Flp
 e/GtVwglf/s8UKjU74a2nsvbzjs9gIlEKjZQdsUY4F1t4EYdyHVVsaDrLSrmbUekqbWmbx3VZ
 F8p21mwYILKhOY0CxDubHYOvgq+b5ttrT7o9/+wM0UJmxKMj/axjFSxMBs2Lwv84WoM9pA+WK
 juRxcpm6wJ/bDlmP7Ahv8I5mq4+2gL5ZyDtlHFUuVIoZMmteGZIjENshq4LzEFEochORUdTtC
 VH2iRASCFI0vQTRatGPAo8ism9+w8Kcu3tQi27+cgHF3nkoXbSljW837kS0/xAgslK7jvF0NR
 /J4hgtNmLMIYUfz8RAQj48paBwIPZXecU2NYuhA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="qKf/Mw5e";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 27.09.20 03:13, Peng Fan wrote:
>> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
>>
>> On 25.09.20 09:55, Jan Kiszka wrote:
>>> On 25.09.20 09:30, Peng Fan wrote:
>>>>> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
>>>>>
>>>>> On 22.09.20 08:45, Alice Guo wrote:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .platform_info =3D {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/*
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * .pci_mmconfig_base is fixed; if you change it,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * update the value in mach.h
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * (PCI_CFG_BASE) and regenerate the inmate
>> library
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 */
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pci_mmconfig_base =3D 0xfd700000,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pci_mmconfig_end_bus =3D 0x0,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pci_is_virtual =3D 1,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pci_domain =3D 0,
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.iommu_units =3D {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D
>> JAILHOUSE_IOMMU_ARM_MMU500,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .base =3D 0x51400000,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x40000,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arm_mmu500.sid_mask =3D 0=
x7f80,
>>>>>
>>>>> How is the sid_mask of a platform retrieved? Can this be derived
>>>>> from information in a normal device tree?
>>>>
>>>> This could be get from device tree, to i.MX8QM, iommus =3D <&smmu 0x12
>>>> 0x7f80>;
>>>> 0x12 is sid, 0x7f80 is sid mask.
>>>>
>>>> Sid mask is use to get the extract the exact sid from SOC internal
>>>> BUS, You could think as below:
>>>> Bus signal & 0x7f80 =3D 0x12
>>>>
>>>
>>> Understood - but there seems to be nothing like this on zynqmp, so I
>>> tried both 0 and ~0, so far without any sids assigned to the cell. I
>>> would have expected that something breaks then, MMC e.g. There is no
>>> error reporting in the SMMU code so, thus I will simply see stuck DMA
>>> requests?
>>>
>>> I guess I need to study that SoC to understand what can be expected
>>> there, i.e. which devices are under SMMU regime. Unfortunately, I do
>>> not have the MX8QM running here yet to check your setup.
>>>
>>
>> I do understand now how the 14-bit IDs on the zynqmp look like and that =
they
>> cover all units, including the SD interfaces that I'm currently using fo=
r mmc
>> and wifi. But leaving those stream IDs out generates no apparent error.
>>
>> The SMMU seems to initialize fine (I've already cleaned up the output):
>>
>> [...]
>> Initializing unit: ARM SMMU
>> ARM MMU500 at 0xfd800000 with:
>>   stream matching with 48 SMR groups
>>   16 context banks (0 stage 2 only)
>>   supported page sizes: 0x61311000
>>   stage-2: 40-bit IPA -> 48-bit PA
>> Initializing unit: PVU IOMMU
>> Initializing unit: PCI
>> Adding virtual PCI device 00:00.0 to cell "Ultra96"
>> Adding virtual PCI device 00:01.0 to cell "Ultra96"
>> Page pool usage after late setup: mem 63/991, remap 37/131072 Activating
>> hypervisor
>>
>> But that's it. DMA is still happily flowing. What could that mean? What =
do you
>> get on the imx8qm when dropping the sids from the root cell?
>
> I am not sure how zynqmp use SMMU and how their bus signal looks like.

https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultras=
cale-trm.pdf,
Figure 1-1: There are 6 Translation Buffer Units (TBUs), managed by the
Translation Control Unit. Those TBUs seems to intercept all interesting
DMA transfers, including the SDIOs I was testing.

>
> To i.MX8QM, if the IP DMA has SID, but without SMMU context programmed,
> the smmu will bypass the translation per the configuration is bypass in s=
mmu
> driver, so if dropping the sids from the root cell, it will work well, no=
 error.
> Same to inmate cell.

If I take your configs/arm64/imx8qm.c, remove SID 0x13 e.g., will DMA
requests from that source be blocked with the current setup? And if I
remove all SIDs, will nothing work? That would be my expectation. If
that is not the case, we have an issue. How to isolate a device from a
cell or the complete system then?

>
> You could try to not bypass SMMU transition in smmu driver, then the syst=
em
> might not work well.

Where is this bypass controlled? In the SMMU settings? Or is that
platform-specific?

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/143f5a37-9cdc-d2ef-581e-7f7144b6a709%40web.de.
