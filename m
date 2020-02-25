Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5632TZAKGQET6TOXTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B0F16C3C8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Feb 2020 15:23:52 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id b15sf2340686ljp.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Feb 2020 06:23:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582640632; cv=pass;
        d=google.com; s=arc-20160816;
        b=YKTLkkVF58Ot9SLXmekHiZbSQ0Loezms/bMQNHbWKwfED3+6xdGz/RCJQUjIMF7Cgb
         ESuc+7T7Lg1Q3Xuo1NvUujuUvJxHUybt7vzVQGxafBjyAr3XNEBJ3YRxj3TxzVHwwJye
         JM/S4ETSTODAGJfQLDX6zq0C3YdiY6dOE6z9UreW8M7k3I07avZrzzMCEF8wIt0qY0Kv
         bP5RVgVXVGQBm1iluPCzFAHuPi3KwaB6dAomILzABoc3CZWbAJod3TIAI0U9adaU+Bk/
         II3L0bOICOdUO0jOFgp08JO9NkW/pOE/3TChKZBLUiNCfghwuLSPbZJ9aeG/t+dvEgsO
         ddkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=sfjeX9NY9iUWk6ts1Arx5ehMZfbFPtA7Tsf/2WruLTI=;
        b=ncR+qtgtZd2sWXeWhQivBxzYCPm1kqEJAdbPaWgfhqYczQ1s0lYzMDWg0c4iL14UpZ
         hfIazbNhy0PJ9CIOul26KQfcTgzg0Lsy5teOwKpRo7dUhiGXQOy4zUyTHu91spnjLY3D
         FNGSCaLQByacoFMnrp/4X+p6T1e/q2ODUYMF9dv7Kn1RcGos35HpDQlovF9qoPerZX+I
         E6DF2zZpwUqUn85C+Ufa0B1IA/K38CeDYPKqgb8VnbFEikWKn5RA92644kGa5+uecITS
         Yez+WTSWtqlBTDjeKqmOyajMNJAlIuw5zJejwIGb7ma41itRc70Ump7Y1juwDDdo11rD
         b/jw==
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
        bh=sfjeX9NY9iUWk6ts1Arx5ehMZfbFPtA7Tsf/2WruLTI=;
        b=HEKE9bRnzeFp/1CmcM8ZASkK76g+8uj131kWThzdayH9hsl2xQ8QuYeHp3+SCBympc
         sPiQl+wXDE46OakoTpqjMQ1U5g8+jkZKaHXhZoUtoCMzEuhLVCFvjlZTHSkCoJopvFJg
         ILWBsik/WDflc/RNm19KPpJSmy5rbqXWNBbO9rrsdrgVw8WkqK1OZ6AOFv4i9snodO2u
         Bfs8iHPOzfHv4i+C2O2QfDfna4JfWiKDy7WtlyDXcLvPCe+x2FB1cgBRU+f9XynN/Zns
         oAqCf7EgsPgOa7F2kj3JyS1YS0to/kkCwqxvyeZPPBug4/Omg5fh4sWtc55RZv0pX3ym
         a79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sfjeX9NY9iUWk6ts1Arx5ehMZfbFPtA7Tsf/2WruLTI=;
        b=FHzUwfByQHVLTmx9CiiZLFu/CjQHB+uy61rQNTc7iuDxRFeI4ufsmOZnsaaKQoieZR
         fDAAHX6UWsf21buzS6GSWpfSnPY+kkeYr2HsS59mHojHIRZvtco3rDlQoK6wXAqmNlUY
         Q8Q97TJONaPxoz3X61+m5UxKdsqOlf2UfstJIrRwVNB3pdmR0507Yu3FhsCvoo22zWr9
         WLCTaNnVaoxzrmTXs2OCqZpPf3MVsI8C1ny7xksPAbd7vYLLnON+ZhQhkTmooGBwpvay
         vAqmBDeHi5lwfDs12DO7oVkIz3ROZEq6pQ9wBi57s6jbHA613LkN1+jO4hLi/V+esylC
         CwIw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUGOMODex/AKo0llbIfO271id7TU5oyHkjpdExR0hanchY8prAV
	2hbLlqGLzvlEHO/V2rpL3DI=
X-Google-Smtp-Source: APXvYqybbwjAz3Yfa8GzrvifIQw7PHlVGGOaKMw4a4SAeBgAu9VaEUpOk/R1/S2KbmAQKYBR2Gl8pg==
X-Received: by 2002:ac2:5633:: with SMTP id b19mr20054348lff.149.1582640631869;
        Tue, 25 Feb 2020 06:23:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6809:: with SMTP id c9ls2181663lja.1.gmail; Tue, 25 Feb
 2020 06:23:50 -0800 (PST)
X-Received: by 2002:a05:651c:297:: with SMTP id b23mr33900637ljo.260.1582640630799;
        Tue, 25 Feb 2020 06:23:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582640630; cv=none;
        d=google.com; s=arc-20160816;
        b=czcLSupIIqAT6ZUqYt/aPnp+3w7hrZ2cEh2HuvHZHc7rrq8rA74By90hdNjqQafVQx
         u/0CS/oj/kami/BnffGbmWQrbKZFj1tu0mYptBTg6XTcbq4ObYShN0QXND0q+m8LPcCl
         4CUkjaGofyNN19pBGsnVN4YHVsoQpKMi+Qfq08125gizR2wtr+AuqZ2IITM+TMCboIWj
         kO0jNDv6zbgG6iQF9imhQcRL/O+fEELE5Rw8bReFEfeG/I2xzY2vO2tuDsHpBnMCoQ4h
         24v2AYe6MFVWE49U9h2HIUVSya27lpvWYtduSaaT2PTfL0C+3DqIffVWz7vA5gVQwt8X
         frcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=EnkyPtt2cQiM84cHq5NgO4Es7vj36PaO2s7xlJjDZyw=;
        b=dc+SuoEzZ7f5MHhdFM0JsOGj7ZRhiPo2nwP3wUkv/Zvf0LB7IYmJq3g+xxDLHLDbmu
         NMA5jkwtwNgvGyYLeLJhw6T96J/Ua+Xd+O4qhSQLBOX+gRa7Dz378CywQVK+R64aLFef
         9i27Xq2VFcAoiazPwzhO7sEHoPWKgQbu1PVPFKVEqEfPVCOX/eHaMScUwNqpC5CBgIAA
         KFdztFJ9ZMjL0aFUVFhbDUvF0g6kYunR7fBykh0/q+krdZoU6vpOLp3dVBZox2ytDqC4
         yW5ak7mzN7cNNH8MzV/RBbOJzxSNDDx9eyv5H7lW9HpfF31GjFhBtFVg9VA/BooqIiQy
         7c8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id v2si1103820lfn.4.2020.02.25.06.23.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Feb 2020 06:23:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 01PENnha008785
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2020 15:23:49 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01PENmxJ020959;
	Tue, 25 Feb 2020 15:23:48 +0100
Subject: Re: Linux non-rootcell with IVSHMEM
To: Philipp Rosenberger <p.rosenberger@linutronix.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <f7fabeb5-5a7e-a886-03ec-417733aa985c@linutronix.de>
 <3ecaaaf1-4787-bd02-c272-590eb1d30a08@siemens.com>
 <1bd62035-a671-a269-3c8e-82ba3063d1c0@linutronix.de>
 <7557bc16-d8c7-7b60-7aaa-6914d9effc51@siemens.com>
 <af52b1de-e2d9-99c1-7f97-0c927d0076f0@linutronix.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1bea34d1-7171-0043-0b27-bcb4b23a30d7@siemens.com>
Date: Tue, 25 Feb 2020 15:23:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <af52b1de-e2d9-99c1-7f97-0c927d0076f0@linutronix.de>
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

On 25.02.20 15:16, Philipp Rosenberger wrote:
> On 24.02.20 11:07, Jan Kiszka wrote:
>> On 24.02.20 09:46, Philipp Rosenberger wrote:
>>> Hi Jan,
>>>
>>> thanks for the fast reply.
>>>
>>> On 21.02.20 09:31, Jan Kiszka wrote:
>>>>> I start the non-rootcell with the following command:
>>>>> jailhouse cell linux configs/x86/inmate.cell ~/nfs/bzImage -c
>>>>> "console=3DttyS0,115200 8250_core.skip_old_serial_uarts=3D0xE
>>>>> earlyprintk=3DttyS0,115200 ip=3Ddhcp root=3D/dev/nfs rw
>>>>> nfsroot=3D10.23.2.107:/home/ilu/projects/autojailhouse/rfs,v3"
>>>>>
>>>>> Here is the log from the hypervisor:
>>>>>> Adding virtual PCI device 00:0c.0 to cell "my-inmate"
>>>>>> Shared memory connection established, peer cells:
>>>>>>  =C2=A0=C2=A0 "RootCell"
>>>>>> Adding virtual PCI device 00:0d.0 to cell "my-inmate"
>>>>>> Shared memory connection established, peer cells:
>>>>>>  =C2=A0=C2=A0 "RootCell"
>>>>>> Adding virtual PCI device 00:0e.0 to cell "my-inmate"
>>>>>> Shared memory connection established, peer cells:
>>>>>>  =C2=A0=C2=A0 "RootCell"
>>>>>> Adding virtual PCI device 00:0f.0 to cell "my-inmate"
>>>>>> Shared memory connection established, peer cells:
>>>>>>  =C2=A0=C2=A0 "RootCell"
>>>>>> Adding PCI device 02:00.0 to cell "my-inmate"
>>>>>> Reserving 5 interrupt(s) for device 02:00.0 at index 136
>>>>>> Removing PCI device 00:00.0 from cell "RootCell"
>>>>>> Adding PCI device 00:00.0 to cell "my-inmate"
>>>>>> Created cell "my-inmate"
>>>>>> Page pool usage after cell creation: mem 377/975, remap 65546/131072
>>>>>> Cell "my-inmate" can be loaded
>>>>>> CPU 3 received SIPI, vector 100
>>>>>> Started cell "my-inmate"
>>>>>
>>>>> I get no errors or anything. The cell starts without problems when I
>>>>> remove the IVSHMEM parts from the config.
>>>>>
>>>>> I use the following kernel:
>>>>> http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queu=
es/jailhouse
>>>>>
>>>>>
>>>>>
>>>>> And the jailhouse from the current master branch
>>>>> (5dbdcbc720c94f79913b1c1b966f87d314d333b5)
>>>>
>>>> That kernel contains support for virtio over ivshmem, and you are
>>>> exposing two frontend devices, likely without having the backends
>>>> running. Start with removing those frontends again if you are only
>>>> interested in ivshmem-net or custom ivshmem (via uio etc.). If you wan=
t
>>>> to try virtio, make sure the root cell has the backend demos running
>>>> (tools/virtio/ivshmem-*). See also
>>>> https://groups.google.com/d/msgid/jailhouse-dev/cover.1578407802.git.j=
an.kiszka%40siemens.com.
>>>>
>>>>
>>>
>>> In the end I want to run the whole ivshmem stuff including the virtio-*=
.
>>>  =C2=A0 For now I removed everything except the SHMEM net stuff.
>>>
>>> The rootcell looks ok:
>>>> [=C2=A0=C2=A0 27.704596] jailhouse: loading out-of-tree module taints =
kernel.
>>>> [=C2=A0=C2=A0 30.266681] hpet: Lost 1859 RTC interrupts
>>>> [=C2=A0=C2=A0 30.266938] pci 0000:00:0f.0: [110a:4106] type 00 class 0=
xff0001
>>>> [=C2=A0=C2=A0 30.266961] pci 0000:00:0f.0: reg 0x10: [mem 0x00000000-0=
x00000fff]
>>>> [=C2=A0=C2=A0 30.266969] pci 0000:00:0f.0: reg 0x14: [mem 0x00000000-0=
x000001ff]
>>>> [=C2=A0=C2=A0 30.267208] pci 0000:00:0f.0: BAR 0: assigned [mem
>>>> 0x90400000-0x90400fff]
>>>> [=C2=A0=C2=A0 30.267214] pci 0000:00:0f.0: BAR 1: assigned [mem
>>>> 0x90401000-0x904011ff]
>>>> [=C2=A0=C2=A0 30.267295] ivshmem-net 0000:00:0f.0: enabling device (00=
00 -> 0002)
>>>> [=C2=A0=C2=A0 30.267339] ivshmem-net 0000:00:0f.0: TX memory at
>>>> 0x0000000100701000, size 0x000000000007f000
>>>> [=C2=A0=C2=A0 30.267342] ivshmem-net 0000:00:0f.0: RX memory at
>>>> 0x0000000100780000, size 0x000000000007f000
>>>> [=C2=A0=C2=A0 30.267809] The Jailhouse is opening.
>>>> [=C2=A0=C2=A0 30.273553] ivshmem-net 0000:00:0f.0 enp0s15: renamed fro=
m eth0
>>>
>>> But when I start my non-rootcell it just hangs like before.
>>>
>>> my non-rootcell:
>>>> #include <jailhouse/types.h>
>>>> #include <jailhouse/cell-config.h>
>>>>
>>>> struct {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_cell_desc cell;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0__u64 cpus[1];
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_memory mem_regions[9];
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_cache cache_regions[1];
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_irqchip irqchips[1];
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_pio pio_regions[5];
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_pci_device pci_devices[3];
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_pci_capability pci_caps[13];
>>>>
>>>> } __attribute__((packed)) config =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0.cell =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .signature =3D JAILHOUSE_C=
ELL_DESC_SIGNATURE,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .revision =3D JAILHOUSE_CO=
NFIG_REVISION,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "my-inmate",
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_CELL_=
PASSIVE_COMMREG |
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .cpu_set_size =3D sizeof(c=
onfig.cpus),
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_memory_regions =3D AR=
RAY_SIZE(config.mem_regions),
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_cache_regions =3D ARR=
AY_SIZE(config.cache_regions),
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_irqchips =3D ARRAY_SI=
ZE(config.irqchips),
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pio_regions =3D ARRAY=
_SIZE(config.pio_regions),
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_devices =3D ARRAY=
_SIZE(config.pci_devices),
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_caps =3D ARRAY_SI=
ZE(config.pci_caps),
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0},
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0/* CPU 3 */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0.cpus =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x4,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0},
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0.mem_regions =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IVSHMEM shared memory r=
egions (networking) */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_SHMEM_NET_REGION=
S(0x100700000, 1),
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* low RAM: 1 MiB */ {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
hys_start =3D 0x100700000,
>>
>> You have low RAM and ivshmem at the same location.
>=20
> Thanks for the hint. I fixed the location. Now everything starts fine. I
> can bring up the interface in booth cells. I get no errors, but I can't
> ping the in any direction. Can I enable some debug messages or where
> would I need to add something to debug these kind of issues?

[re-adding the list]

If you don't get interrupts into the root cell (but the non-root does=20
get some), you likely need to tune the iommu index of the ivshmem device=20
in the root cell config. If you have two units, pick .iommu =3D 1.

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
jailhouse-dev/1bea34d1-7171-0043-0b27-bcb4b23a30d7%40siemens.com.
