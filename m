Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPX64CDQMGQEPNDJNRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9413D1294
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 17:37:35 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id o10-20020a05600002cab02901426384855asf1163921wry.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 08:37:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626881855; cv=pass;
        d=google.com; s=arc-20160816;
        b=IPmwQy9UoBld5e5AGU0gdy717+L16dleMyFF+F67ydngyxU1EBpg2MsY62C0jXjAqD
         9wjM989z6+bapM2UMS5jqzkWwdj744eXugB9yGNyFoJ0GtWeZUeBYN7FzQsBqDwu8HrY
         gx1AvSyHeZyY2WdKVgCX7RjRcEpTXcpD4jomH3RMjgYxr9buo90THmSapvHM7xgpvP4A
         JZ4VJ11DUDohiS2c3+GSlXp53b3ns+CFV/sYkkt2Uxyg4Ex2lzz3FWCyuNcmnBr1DDjM
         WmXfVFyiDiUtOZGAvk1VwiRU1Ggdf8OrRT9gAf19FVkQGlj23F12yt5PTufxeTxcU6JA
         VVMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Wg9l28cLW/7ia4mvwTyY1RKUhubW74Tm7AsZCzNbHSg=;
        b=D9wGP9eP+i2fUCeHng/EZD6Fg8CjXoiyRZ1JAzyA/cgWHfecFVf6LuC6lxk/+Eop84
         u6g2Yqmn6QgfkrFPuvSOVMBcHZ9fmSLkLA4agbKD/I72q54pjqJYnatlmoF2r5bxoN/I
         myzUHrslTZUa4YjvZjSsUs9d786IEOPjI6YTcC8qLUnNonw7tfwRJN7Xd5WAJQuB/erm
         ECquWUGNYTRMwZm84ysudGQ1bbXQ/eSKCIuqxnl1CQMvAdQLikXIIcO5C9PFuRpdkkld
         FEO+7UxZgIctZ1YP2oWvPS5rOq23RP05pNljAcuAULvCWxrnwN5utIHsPjaZeOZ7qTkD
         zg/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wg9l28cLW/7ia4mvwTyY1RKUhubW74Tm7AsZCzNbHSg=;
        b=dP/mUQOF1TE7WwqErMTFxoEb7/16sNrjBLigToqpf1SV9FdFYahDLlDkkYdaCLBeaj
         2bTfwDJUx+4H5247h2S0u74/ZcbjJSqxGyJNdgHCUMjgSkhntm0LYxpxC+dSieevhjSM
         98m0pFsT5jaov5wq0z9/Q9yCw5QVr0iPCIIPgaeBJNX7xXpYlmz0PaieESy9I2KD/sII
         p/qg4tALzxDnX1Y6h1YrU93bfiIFNSbY3iywtQRvpoe0echr82MibH+9MjwsY0hulZOY
         PBv6THdbCYj5dGt60uBDeXMGpjhwMVokouleKsyGyPDyYn6cl+iUJzMEub9NB0MLKRiB
         2p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wg9l28cLW/7ia4mvwTyY1RKUhubW74Tm7AsZCzNbHSg=;
        b=IPMqUGtZCWtjUSMNEtvXJHnitU4B8MtGOuXh88nMZpikKDorhj9rB0+eVEiox7bTIG
         9mS1fg3Nl31jDmko06028hJMjcyps7mTVLdnf7vwFmEDTKaCN4UkdaoU7kHC2ZV0xHj4
         Fbq+gAp8VvPkmigw2eukB1+IStNXlrVkCnVby8q0Frrhv6WzIeVFy9xfhpAFkEXiyS2W
         xi5rYr3FFCzG0ZMKxyffOJv0W/7EiSDxoRdG35gYKKW5aQlVM3FcPfnKCrH1c42nZo0E
         AfE7DICy/y7vheD2CQJ8wZ/Q8OljynK4PPZsdJSmv0lGi73szulbbxQkZw4p+jieVRKC
         BuAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532mPFLdu/6XMdWZyho6EC5TtOM5xRogHGOxymHyPR9rAYXxXuWO
	dRxQCaeyMXI5xy+m11LW67M=
X-Google-Smtp-Source: ABdhPJzk43Kg9jpjvBUo+d9W+kHLfPgskZnFNKthx/JOzkMKnBvxPDxzzc/FtGNMC2B555Ao/8at8g==
X-Received: by 2002:a05:600c:364c:: with SMTP id y12mr4690940wmq.78.1626881854849;
        Wed, 21 Jul 2021 08:37:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4786:: with SMTP id k6ls3209081wmo.0.canary-gmail;
 Wed, 21 Jul 2021 08:37:33 -0700 (PDT)
X-Received: by 2002:a05:600c:35d1:: with SMTP id r17mr4745217wmq.98.1626881853826;
        Wed, 21 Jul 2021 08:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626881853; cv=none;
        d=google.com; s=arc-20160816;
        b=HW1uNuE7jYfoTK3SJ0OTxuLqFCx+wh6FFMIbCx+M4ZYUa1fnlng8BD1ZYvUCA4peo5
         jaqseLgTj+J30JzeeQqbN9Orab5ZXo4WIgt/ZTafjfouOEfKNX6sKH4MmYxeF2wZFBVi
         G3ZRpd/48li7gvsP6QxuXPtk0wRTDbppV6ggrtYCCswlCpUE5bRfCcgr9aZagcfp4VJ0
         hk8s+EezqMageeK2vF7h8g65bneYloUb3q4EvsYRIUAjvjjyvQtt7rDsztpsRX7vm8qE
         2xJfaXDftNBA+b9fYm96gJ0vcwmoB87fISJE/yWZnmao9D5+BRFNo3bAE6vwJbeM43C1
         026g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=JMgJ1ljnB7S6TbvoKzDsnsctWNYDaCkw5Beqc80cdm8=;
        b=cdhnRMwPAA0ILq0tvnMibq7iV88E5U7mpuMn23SgXw5hkaV5+r/8mim1f2qj7GVGWR
         0tU+87dBL9/MGVHWSw+Mm3/zkrs67McoVBh7p4vEIRLpPI9aRPEzTKEBe6z0u3T1MKOg
         CvH7eiLnIFIvPrXdRkmqeLwG2mqau/PXCesObxDfW11Z8i9G8Gmh5/SkT5ELMx8cRi3K
         i8sM+1Vo6RySBAFZv/RQX659NqOEjuMbot3WYLr0QAUVa/6cd2NJx1HQHAr40tfPj+bs
         tZaKkiTuZkBkjOOTCeo+xPjfHcqGFSzR0ZTZut8MZDf0DTpxZzjOWtj/RL7Ak3ZND/j2
         ujSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id v4si1190968wrg.2.2021.07.21.08.37.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:37:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 16LFbWjK017329
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jul 2021 17:37:32 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16LFbWsE020675;
	Wed, 21 Jul 2021 17:37:32 +0200
Subject: Re: MSIX Enabling Error on TX2
To: yohenn perrot <yohenn.perrot@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <6d11e4f6-9619-4f1f-8fff-ac5c8409ea70n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5affd5e9-79aa-96c2-c78a-bfd67cc2a7fd@siemens.com>
Date: Wed, 21 Jul 2021 17:37:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6d11e4f6-9619-4f1f-8fff-ac5c8409ea70n@googlegroups.com>
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

On 09.07.21 10:09, yohenn perrot wrote:
> Hi,
> I'm working with Jailhouse for linux version 4.4 on Nvidia TX2. I have
> currently 5 cells that communicate with each other.=C2=A0
> In order to communicate with linux root, I implemented 5 vPCI devices in
> the linux-root. After some researches I found that a cell cannot have
> more than 4 IRQs, so I'm trying to implement msi-x.

Well, you can IRQ sharing when using legacy INTx, that should work.

>=20
> Currently, I have *ENOSPC *error during the *msix enabling=C2=A0 function=
*.=C2=A0
>=20
> With *sudo lspci -v* command , I can see that a memory space is
> allocated for the MSI-X.
>=20
> /00:04.0 Unassigned class [ff00]: Red Hat, Inc. Inter-VM shared memory/
> /Subsystem: Red Hat, Inc. Inter-VM shared memory/
> /Flags: fast devsel/
> /Memory at 40104000 (64-bit, non-prefetchable) [size=3D4K]/
> /Memory at 40105000 (64-bit, non-prefetchable) [size=3D256]/
> /Capabilities: [50] MSI-X: Enable- Count=3D1 Masked-/
> /Kernel driver in use: uio_ivshmem/
>=20
> I set up the linux root cell like this :
>=20
> /=C2=A0.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,/
> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .bdf =3D 0x4 << 3,/
> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .bar_mask =3D {/
> /0xfffff000,=C2=A0 =C2=A0/
> /0xffffffff,=C2=A0=C2=A0/
> /0x00000000,=C2=A0/
> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000000,/
> /0xffffff00,=C2=A0/
> /0xffffffff,=C2=A0/
> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 },/
> /
> /
> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .num_msix_vectors =3D 1,=C2=A0/
> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .shmem_region =3D 68,=C2=A0/
> /.iommu =3D 1,/
> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,/
> /.domain =3D 0x0,/
> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },/
> /Do you have any suggestions on the problem encountered ?/
> /It seems that=C2=A0 MSI-X are different for virtual devices is that righ=
t ?/
> /

In order to user MSI-X on an ARM platform, you need one that at least
provides that for its physical devices already. In the best case, there
is generic PCI host controller that supports MSI/MSI-X and Jailhouse
could simply plug into it to inject the virtual devices. But that only
worked once so far, for the old AMD Seattle platform.

Our current virtual PCI host controller does not yet support MSI/MSI-X.
That is primarily due to the tricky binding between it and the
(non-pluggable) IRQ controllers of the platform that have to support
message-based interrupts. And there might be more complications that I
forgot about.

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
jailhouse-dev/5affd5e9-79aa-96c2-c78a-bfd67cc2a7fd%40siemens.com.
