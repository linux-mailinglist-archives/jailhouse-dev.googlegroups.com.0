Return-Path: <jailhouse-dev+bncBC33JYE2XMMRB76DSLWQKGQEHT6CBJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53b.google.com (mail-pg1-x53b.google.com [IPv6:2607:f8b0:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B5D6746
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 18:27:45 +0200 (CEST)
Received: by mail-pg1-x53b.google.com with SMTP id u4sf12973208pgp.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 09:27:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571070463; cv=pass;
        d=google.com; s=arc-20160816;
        b=a+MKAGI1r361Is4Jo5A5uzLOF7sbJP/4HMdBLNL86OJxwA5olbuaAfJF7hFjgoLcpV
         TTD+fXlDNOj0bH0/kFZAhK5HnNlhyEirCK/orGHxTvSMeBM4dkydPzSkDS3R1R8nyoXR
         F6fiTE45u0r7HUkpatKTe7WKS5OJG1BcBQyNXYJxQKnmipVc/u8JgPX1yg/0dbIk+m0s
         lbdoMuMlNtWIwsaUb+pspnLhn1Hvt3xtVAq6cHYczjuzjmDaYpBGKbDfMXMsmZy5zztg
         VfkArVNR4fm4Q8n5lVDCAwN9PH2AWlC7BnjfbugAP/N87+gAXcyDOdaEaM75Z7ahNu8O
         maGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dOgt8cnc8IGodVmYlGWhLSyHXit+w/RVFou1Nv661AI=;
        b=DmqROuHxOegZmWU/WLe2nsmDS/+hfGxjYI1E+VW2FKA1Tc61r8NMCcPm223/dJ+ltq
         B/WGCcXrMPHZAzkkD2wS1N/lCMA5xpw6tdeoL5FX8Hn5TvR12SEs+XUL+85O+CIjQH4C
         gGZ2Gx1rxKrLaAibTUh/1yFimu3ZWxvs9UOCFjR7AYXNFoo4JCOhBEbF5gkWxeKlkBwT
         dKOh2o5QukwV1t6cgfxTIrCwLc6RrE3PV1V8my+oAoY6TG+yfCowUYtUlcYeaEoWlF5z
         Y/PxavWDeknTCWGnMSrPir1IYAwwHN17BjE2zpVY48n4xVBymEXVKxpZ3Mw+jS0BFLnR
         OkXA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jhyVfHhD;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dOgt8cnc8IGodVmYlGWhLSyHXit+w/RVFou1Nv661AI=;
        b=P0Hz0o1nHzphWPNKbP/C2dvG22Ot0vy5kdisRknlPO3E/nLLlH9p7SDxVo7x5JVFMy
         Tv3RLa6TyE5Q1znBhsgkoFRkxkU4a5NxDBnnf7DZgitka4uPxU+GGR38VLiJstAYQt2F
         jAuoNdBedA833jI1rNJYk/O45jwiXxlv5Yfx658Ll/QfQqjiIDusGECx9UGGzkFNiaY+
         kxUW+dKotl1dlVrV/hR5yrBE00qxF8molKA7WO7+ySpjuOH+HoEtxRaLjHy0lbxiGDDb
         ZWATKSjKHqV6GZzgkko9WnhqZYJRWZHzHiJa7Ecia3Qg/64H6Sh53NMSgBwPdw2EqlF9
         cKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dOgt8cnc8IGodVmYlGWhLSyHXit+w/RVFou1Nv661AI=;
        b=SpqtBfr0Z47gsJIB4yW8QzX14KihvtvcLGTafa3IPAugOE6VXtVgCXu6FnQleBWsKX
         52TaLENd55F6HKYJ5WQIy9A0dmwZifJUquT2DzJoVS1EYc0qiMpOy7dBStfPUxeqQ+GQ
         bPvG6Rj79/2fu6xVgnbQJIfYkRjuiz7gP6U8qIjwmS/vQ6+qGO0q9FKLaKgad8G1pVNc
         LrbluHWaF/NsDTVhqbiVE9X8WK56JifBwLYAv5514EvAtNmFpZjCBUkucQTbVjDbpwQk
         J9m0tHe2ehFi6uK3APGp71IXXUrDBn0Gmq6W9XZr0FAs8/WccLIVDuCnGDIKXkbHeaXm
         T7ig==
X-Gm-Message-State: APjAAAX2Hh9n1ezCn5pUnJrfPuIETQm9oWYBVyOaiexLYkBPJgyKKp/V
	ead1BxFOdtytvgfpLHqp0yI=
X-Google-Smtp-Source: APXvYqw7Hr6nwS0SuVn+aqSvLJghxiWU9YguoV8IwNM76v0hyqVvqj/q5JfIpsoZUTkdk9gADf9QbA==
X-Received: by 2002:a63:7a54:: with SMTP id j20mr14054559pgn.355.1571070463638;
        Mon, 14 Oct 2019 09:27:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:5107:: with SMTP id f7ls4139470pfb.2.gmail; Mon, 14 Oct
 2019 09:27:43 -0700 (PDT)
X-Received: by 2002:aa7:8b02:: with SMTP id f2mr34260165pfd.31.1571070463052;
        Mon, 14 Oct 2019 09:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571070463; cv=none;
        d=google.com; s=arc-20160816;
        b=QFKezCIzds3j8OJD9NlEdQ843WDm6imYrQgZGALPN0BB3O2Yyjq+V2yPCv5wQdl/P5
         akmdCZudzjWZ6ciemz2XU40ZPY9CbZKpqizoqRjDNYpyf1t9AJBo2O2e3poZlFtPAKN8
         7+YZ1J/DfhroeDYz0wcFzwZxeFkHqkFhHTkJT7DElUu26dTDitjfXRovSeFLj28bSyEL
         xZU2mRpp3ftLGBY2fSxdxJO/L3Ny+7P54fPfkAbr431OmD6QzhaVm9p8B0rwMMoqO1fA
         2qiURzdzNeDJtOMGoeo5GxGMb/1IeEA7q10WTlX2L92Ppt8DglivXt4+30Xhy0Lu39d7
         GHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=pv+PcWoVykOTGpel2VzHTeapvB8dVunnZB54fr1se+E=;
        b=efja0LA6uJUfR+y1PyFm1aaJY1syCsttw5QqJaRkoW0wyma4jPKvnC70QXw4YdSZo0
         eIbMo2bPKQ8/GLz77IYpy5wsoSStbW2HnFWrunGwm5ryQOi5n19MlRD+uUILf0/PMqNl
         BrwnSd9iWX7lveWm+QiDKAPTuFHDLXCEm6E2M04sfLElIbtCyLZ52XBzCtMmi1MYIw9x
         Mx2pXUaAi7lvjNmKlt5THQcrYwq00KmPkPiVhmVskWDEBdVFq0QLOf16a6JQocWHCFHN
         vA0QwThfb7Jn2P/GMvF+kaWr4Cjx1NDgIcZmFHKhs86ti1AhIya/TJmR7QR5c972iiRl
         7NBw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jhyVfHhD;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id x13si525704pll.1.2019.10.14.09.27.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9EGRgm1097142;
	Mon, 14 Oct 2019 11:27:42 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9EGRgd0091576;
	Mon, 14 Oct 2019 11:27:42 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 14
 Oct 2019 11:27:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 14 Oct 2019 11:27:41 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9EGRfov066588;
	Mon, 14 Oct 2019 11:27:41 -0500
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
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <1442124d-f24d-4cf5-4d93-0605971dd1f8@ti.com>
Date: Mon, 14 Oct 2019 12:22:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <fa5bfefa-d575-2e5d-8165-b7502b9e505b@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=jhyVfHhD;       spf=pass
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

On 10/14/2019 12:02 PM, Jan Kiszka wrote:
> On 14.10.19 18:01, Jan Kiszka wrote:
>> On 14.10.19 16:31, Vitaly Andrianov wrote:
>>> Jan and Ralf,
>>>
>>> A while back I tried unmodified hypervisor by just adding
>>> am572x-evm.cell config.
>>> Basically everything worked except cell destroy. I repeated this
>>> experiment today.
>>> When I issued the cell destroy command I got:
>>>
>>> root@am57xx-evm:~/jh# Closing cell "AM57XX-EVM-uart-demo"
>>> Page pool usage after cell destruction: mem 49/4073, remap 5/131072
>>> [=C2=A0 187.112795] CPU1: failed to come online
>>> [=C2=A0 187.118622] Jailhouse: failed to bring CPU 1 back online
>>> [=C2=A0 187.124806] Destroyed Jailhouse cell "AM57XX-EVM-uart-demo"
>>>
>>> After that Linux is running on ARM0 core only. Basically I can create
>>> another cell for gic-demo.bin, I can run it and shutdown. I cannot just
>>> destroy the cell with getting ARM1 running Linux again.
>>
>> Yeah, this is a familiar pattern when things go wrong during cpu-hotplug=
.
>>
>>>
>>> As far as I know when we issue cpu_down() the CPU is calling WFI
>>> instruction (Linux kernel page) and waiting for event. When we create a
>>> cell the hypervisor switches the page and runs the ARM1 at the same WFI
>>> loop at virtual address 0x0. I guess when we destroy the cell,
>>> hypervisor shall return ARM1 kernel page and cpu_up() should continue
>>> from that point.
>>
>> Yes, basically save-restore of the CPU state, at least /wrt its relevant
>> parts.

I thought that is hypervisor responsibility when it executes the "cell dest=
roy"
to restore the cpu1 virtual memory to the point when it was on the "cell cr=
eate"
state. As I understood hypervisor calls cpu_down() and after that creates t=
he cell.
On cell destroy it restore cpu1 state and calls cpu_up().
Looks like my understanding was wrong.

So, how to resolve this issue? You said I need to add the "soft cpu_down".
To where? kernel? or hypervisor?

Thanks,
-Vitaly


>>
>>>
>>> When I was debugging this issue that time, I saw then after destroy the
>>> ARM1 remained executing WFI and hypervisor page. I didn't know why was
>>> that, and adding AM57XX unit helped to solve this issue.
>>> But may be that is just a hack and you have a idea how to solve the
>>> "destroy" issue w/o introducing the AM57XX unit.
>>
>> Well, the code you added, just like my original version, emulated that
>> save-restore in so far that it pulls the resume address that Linux was
>> likely using during bootup from OMAP_AUX_CORE_BOOT_1, applies that, and
>> immediately lets Linux run again. Hopefully, but that needs validation,
>> this will cause Linux to directly enter WFI again until cpu_up sends the
>> wakeup interrupt.
>>
>> The fragility of this comes from reading OMAP_AUX_CORE_BOOT_1, rather
>> than actually saving the state when we take the CPU from the root cell
>> and restoring it when we return it.
>=20
> BTW, that pattern could actually become useful beyond that AM57xx: The
> RPi4 has a similar limitation (no PSCI) and will need such a soft
> cpu_down as well in order to support Jailhouse one day.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1442124d-f24d-4cf5-4d93-0605971dd1f8%40ti.com.
