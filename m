Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBJOKSLWQKGQERWS4XWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AECD678A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 18:41:11 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id 59sf18404068qtc.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 09:41:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571071270; cv=pass;
        d=google.com; s=arc-20160816;
        b=hn/JwODxQOLqe0N3DQCrFScSFAXfrifcGjZqu7qDF9dqNiHsLzeoCwqUSABfszokge
         eQHZh4tEqQbaVPYqZpLhbkpF/NsTbQrUaF9sio5roFBROZkns74jGRiRRx3ddtIBbCw7
         JGuPHKm0aj6upcp3MAya8OpXqOWYa6ue4JA+DeIgdT+MHOHVDG55pF5+b5VZplvnyHlx
         Y0v5JFcDS4ot7FE+w/oempeh1p+8X1R57O/QD4Rn0LFK0pD7WSD6pziKkaOcQDmpG7Bc
         TmTYGrEVJ0Wzn5+0DeXxmOaYrEgnbK+1EM5i7CzyRXs7sJFheIAAk9z3wR1M3BoF4n2F
         slGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uYmRf9RwhxMwDjmW9On0IgTM+KwjuCdV/pH7PSU+fPY=;
        b=IAYQOhv6mxcWqdjTrvGw9dz2GD4jQ732uKN2EWmoo/B9ZNAFcU8YZoFMPXbPg7gRMP
         PbjFZmQbleApvwvmJYNtRhmJg+oMoQAqRS+iW2vb+bCIJXbKOD/WjE4CrPq13q4WSuSP
         UIfM6MP7SBcn8WoYCUmJYfDWo2JEqs7XThDSMpOwtq2jCGPY342oaX5YsTFCNa/yTrIf
         e6OFrjW0s+MdqHhrJ0HDasQYbMWQHuHra5C/vlwYE3IJ6hcEBSOQ0GN1kK2mN3d6pGvL
         8NvEL8XBSE7/YzVwNJPhhCQf3i3jStS4V8oXcqABDayGjQ3oAm3zqn0GAADLCygqNPtU
         RCcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Gb98EocQ;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uYmRf9RwhxMwDjmW9On0IgTM+KwjuCdV/pH7PSU+fPY=;
        b=pLVCAhuRbeg0oBfOBH4BoWrC5iWMXx3K6752fncdK8HlhSNO4kUjKD8g5ZOhWcieLW
         SLqoRssW4t6pzqElFkKYUMd0X01bdz2eMlsv2doBdIYc3gEIK2nN5T9NPIsnHI8/JLZt
         SXy/naSPJiZldSx+fUsLJasT10/3d8B1KOprQoji/rck7tFj3ioN4pTlu0VpabbOkUlO
         TNkr2ddmslObNTc8qaxZwyYGjr+yjQuvyu5is+Odt/oF4AV2c9iNv0yV4scWDVt3jlsO
         Blwp6nVKoW9qDzYn9NhRtfvXngokgHqLiyuN+HXj7VhHIZFy1cCdHW4gy4ek5Y+45YGk
         hRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uYmRf9RwhxMwDjmW9On0IgTM+KwjuCdV/pH7PSU+fPY=;
        b=i7PUxEJX/SspWU8g3NfUR8BS+cq/SCGJTAUUP44icOuSIycDdD8FaNr3TyOZVwJn5o
         QMDcDJgfKp6dkP3ZG5GIDxPtuRYHy6Z4J1qm9gzmtr5FkUnDz779Zn+R1VagVJn9xjWU
         EKAkc4yUysr4AAYnP+VsBBHX5j7EI2zZtEMfRzorQP44O7Cohb7sJexhrk73H2f4rVAu
         RBSa71w+CFGbih3fagKd2dJGm/L5X+VDBDXLP8MSB4EMX36UGXYNWPDdOZEzfHgjSjfU
         OQVwpDx5Pf/NB8iliLzDxhq+qDYNq6w63Z/QQPVgmNT3eO445ICXnsBJhGWp/meQa8KN
         EANw==
X-Gm-Message-State: APjAAAXc2uvFTMuMOfunm/uCsnC+327KX5YbZESjefyGYawNFmYNglX/
	4XkyKH5N2De2AwD/vpxz+Lo=
X-Google-Smtp-Source: APXvYqxYG61f3XV8Rdg5RRVhzJ2opUItS6htVgm8jbqh5HNtHZYpqe7k72hMNeAxeCc81vhzioUojQ==
X-Received: by 2002:a05:6214:4a:: with SMTP id c10mr31018500qvr.191.1571071269797;
        Mon, 14 Oct 2019 09:41:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:a853:: with SMTP id r80ls4459920qke.0.gmail; Mon, 14 Oct
 2019 09:41:09 -0700 (PDT)
X-Received: by 2002:ae9:f204:: with SMTP id m4mr30739594qkg.376.1571071269218;
        Mon, 14 Oct 2019 09:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571071269; cv=none;
        d=google.com; s=arc-20160816;
        b=NNCUwfXUTi+ZRG7luwkBQv/kgEhmdGlL25+8RrfQ7y0udr1eYwL/rJ+Msx/SxuCVuI
         nj4Ml3Aja4uoJJtR35Lx2xRP/TgBsrLbGKRWQbLa+kK6BNplxVZmdZ1WLVu/PDBTDtiK
         85U4OmlfdqnlhbJOvaMl7WBXdVv6y0rrfA3Iw195gCo1/Hsadcro2qwiHDXu0nk21o7B
         iXgceH1JvsV4muiUOXZ0zsbkoNEutU++8gIU8z2RxKu+w43QS4LcHRNPana6jSW9JyaG
         sSIkOj+e4MdtgVAfkij/ZNj0aqGHAvKTFEDY1HnjoKjp8k035IDssBOzB4FAW/OX2X8n
         xwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Smb3QSVWOrj+j4SOlnxEL9zlgLDoXxKS2474GETH0kI=;
        b=cPcE8+voSqh/9bneZbLLaK9dFAWB/g+Sfsqwb+puGpxB8aroP7NpsI36x8o8goieGP
         bXlDRNDz+Xj13GebmuTmbH58J/GduK40U3ptjlTuWsClCCiwr5FCXl0+MOeH4RUI5NcF
         x4e6ssxtfV5v1prVqipMrfOTc9WzmHO4ygZXA70nNzPBl7Sc+uVkDvoXXUiP3YzLCymk
         +x+BIofCuSTEP0+e27CPNk4Utymig6dgJRBILhqBE2TlgRlZD13OjN4VWr6cjPS75U5u
         jj7zsNTnna4ZlOumJ087M9nLw4rUjsXPsUyMbchK/zKXecMXhMhW5ik2a5V/3364klvR
         iHag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Gb98EocQ;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id t53si867778qte.2.2019.10.14.09.41.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9EGf8VD100254;
	Mon, 14 Oct 2019 11:41:08 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9EGf8cT110431;
	Mon, 14 Oct 2019 11:41:08 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 14
 Oct 2019 11:41:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 14 Oct 2019 11:41:07 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9EGf7aR083151;
	Mon, 14 Oct 2019 11:41:07 -0500
Subject: Re: [EXTERNAL] Re: [PATCH 3/4] arm: am57xx: introduce support for TI
 am57xx SOC
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        <jailhouse-dev@googlegroups.com>
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
 <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
 <32d719ab-04f9-f57a-d8b1-33f6467da855@siemens.com>
 <f5316d70-5f44-93e0-dc2f-604cdd229fc6@oth-regensburg.de>
 <b3477139-cfe2-b8af-8b42-11487e4e4c87@siemens.com>
 <0368a897-9bda-63fe-5657-89891422c118@oth-regensburg.de>
 <5a39b4c6-2738-95d9-352a-2a79669f1c96@siemens.com>
 <d2ecceeb-3da3-c86b-0deb-fe7deb9c2d62@ti.com>
 <e94f17f5-01da-00c1-a6ea-957de5d8bb63@siemens.com>
 <fa5bfefa-d575-2e5d-8165-b7502b9e505b@siemens.com>
 <1442124d-f24d-4cf5-4d93-0605971dd1f8@ti.com>
 <4afd779c-45aa-e9fc-2c6d-3c63f9361d84@siemens.com>
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <d9906900-5d69-4784-9c9e-ab6e7fc55c72@ti.com>
Date: Mon, 14 Oct 2019 12:35:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <4afd779c-45aa-e9fc-2c6d-3c63f9361d84@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Gb98EocQ;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

On 10/14/2019 12:36 PM, Jan Kiszka wrote:
> On 14.10.19 18:22, Vitaly Andrianov wrote:
>> On 10/14/2019 12:02 PM, Jan Kiszka wrote:
>>> On 14.10.19 18:01, Jan Kiszka wrote:
>>>> On 14.10.19 16:31, Vitaly Andrianov wrote:
>>>>> Jan and Ralf,
>>>>>
>>>>> A while back I tried unmodified hypervisor by just adding
>>>>> am572x-evm.cell config.
>>>>> Basically everything worked except cell destroy. I repeated this
>>>>> experiment today.
>>>>> When I issued the cell destroy command I got:
>>>>>
>>>>> root@am57xx-evm:~/jh# Closing cell "AM57XX-EVM-uart-demo"
>>>>> Page pool usage after cell destruction: mem 49/4073, remap 5/131072
>>>>> [=C2=A0 187.112795] CPU1: failed to come online
>>>>> [=C2=A0 187.118622] Jailhouse: failed to bring CPU 1 back online
>>>>> [=C2=A0 187.124806] Destroyed Jailhouse cell "AM57XX-EVM-uart-demo"
>>>>>
>>>>> After that Linux is running on ARM0 core only. Basically I can create
>>>>> another cell for gic-demo.bin, I can run it and shutdown. I cannot ju=
st
>>>>> destroy the cell with getting ARM1 running Linux again.
>>>>
>>>> Yeah, this is a familiar pattern when things go wrong during
>>>> cpu-hotplug.
>>>>
>>>>>
>>>>> As far as I know when we issue cpu_down() the CPU is calling WFI
>>>>> instruction (Linux kernel page) and waiting for event. When we create=
 a
>>>>> cell the hypervisor switches the page and runs the ARM1 at the same W=
FI
>>>>> loop at virtual address 0x0. I guess when we destroy the cell,
>>>>> hypervisor shall return ARM1 kernel page and cpu_up() should continue
>>>>> from that point.
>>>>
>>>> Yes, basically save-restore of the CPU state, at least /wrt its releva=
nt
>>>> parts.
>>
>> I thought that is hypervisor responsibility when it executes the "cell
>> destroy"
>> to restore the cpu1 virtual memory to the point when it was on the "cell
>> create"
>> state. As I understood hypervisor calls cpu_down() and after that
>> creates the cell.
>> On cell destroy it restore cpu1 state and calls cpu_up().
>> Looks like my understanding was wrong.
>=20
> No, the model so far is that the hypervisor emulates PSCI CPU up/down,
> and that implies a (virtual) CPU reset. On x86, there is an
> architecturally defined mechanism that works via IPIs but it otherwise
> identical.
>=20
>>
>> So, how to resolve this issue? You said I need to add the "soft cpu_down=
".
>> To where? kernel? or hypervisor?
>=20
> For the am57xx, this needs "only" hypervisor changes. The kernel already
> has to support for soft-offline/online. I would say: let's make the
> save/restore working on that device, and then we can think about if we
So, we do need the AM57XX unit at least temporally to implement
save/restore functionality?

> make that a root cell property that controls whether to emulate PSCI or
> use save/restore for the root cell CPU control.
>=20
> To reuse a generic control on the RPi4, it would take also kernel
> patches. But that would be the task of someone else, later.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d9906900-5d69-4784-9c9e-ab6e7fc55c72%40ti.com.
