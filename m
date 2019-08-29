Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD4QT3VQKGQELNPQWRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id E4179A133E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 10:08:48 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id q64sf257915ljq.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 01:08:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567066128; cv=pass;
        d=google.com; s=arc-20160816;
        b=FHZ34O7sp1lIfwwAeLg4RgGZVku5ULI1llfAFDJ2liaIyPRWj8Fi83260D/0Zrnydt
         ExALJB2DKRmcDZGEa9P8iSWtaBKXfA2ySiPVQReJB/pzgKINvNNPBAUxl7Mw1FdHe2Do
         Pp0kXoJ/4UeLSoQVtPlDK/6arhI8xigKlEoNmPl6E3hFwCZ21nFgR7k6sUL7loaeScAP
         fpuCc+mNDfhO4ociBeuAClP+dgIeVYonDpOoaUZjG6IJa+55PcpwCO0AIiNV5QN5t7YZ
         oL7paqeDto3vwJ3qrrDSd0Wn437zs0wewNJHDAkJyXe9NCUVm491QKkK79Ka05hcuxhD
         kCcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=jMI8EyQce2dK8Dh8AqCiMUttRKDPPo71Wt6iVQLzvCg=;
        b=jedvhrcRnwUBKFZBeV5SbTSgZe8pdwpvWyu+xfxDcS6+X9dCOMloPYNUrT6/jlVvrk
         2DR0E6+v1dkkIDDjFZcrvQbbjX6Mwuv/XqrIe0hlRiIeVwTfZaYopjZMCmJMy+oL2uJJ
         samVpJ1+SMoD0/e7xlk93IdBdkHOQIARzOKZwHk1eFAFtjmo/vOKZn4m+N7lQnys8lYJ
         3Itdf9Wr35zssQp262VpGc2NgczR50bEB8wtEy1gXM0Cd9Zdl2+fiGwA0u+3i0GEQSDG
         tmBByWWJSe/8GVYxXyTVE2XH2WucNz2IcAXTUdhcLuNPQGVRK87pMnrkKpSDgT8arG/D
         WSog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jMI8EyQce2dK8Dh8AqCiMUttRKDPPo71Wt6iVQLzvCg=;
        b=qjwFl13CiC5j5InboOahTd7N/mBCcPXoBNl6eI29y88TVDTIzLMoLY9yLWSBc0lI/H
         y+eN7v7QhFtNdXcwZEKPYpAY/UdYY3GMjyEfrmLlXS14PYxp0IsSWmaWkn4M0qO5zQlO
         Iexl8G5n6fiat96NjHGejhJoGN9cCwJH/+TeJHZea4VEr9/ZLA8BlPCHf2OGzYBJkFKY
         nNNXSfzuBzIQavarjZiozNWFgsfBrAn7grshukLpVQpdbsbThf2Z0ytnlcSJBF/wV/EV
         mw2qdb1q3pX57mlsCeif4i982Sg5b4aMEl/BV2LZsfjCH4vAVFh/JucMfCwnsbUlnjTC
         ltmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jMI8EyQce2dK8Dh8AqCiMUttRKDPPo71Wt6iVQLzvCg=;
        b=YUjamMDXFCQOY9oMuNEcYHL6Fm0IK5OFNThkGG/9woANKSYFDdTBkTuF5/4rPHE4nP
         XzVlsBTafmcTUcBES6tFbGf6qv+ihfEfsq9Yflc9Yi7yYJ1HFhV5/c3Yk3q6P7OThTHM
         lp9AVoYNelnP16oFOsCsAYec2CI15iJs/Qb3APrE+st0AbsOfLxckVqz1Wflb0xuDEE1
         a/LZJzx48oFSiyj2+rVHrTCRHPBdvFJTS3p4xut+JhMnAXDwWLN2tejbzftMPwj0TfAc
         GBHw6Q8bmjW1+XX+jBAZ/c+gPU3Ar1rlKz2/AaWyWdBYczTO7YFVV0stmRmJ9XC891As
         i4zg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXDwCQAtB2kwb+tQAIzEBgTuEqVJLWqUrUlql55UyBVVx8bOcjF
	y0QnjzQbl7WDmVRa88h/pcY=
X-Google-Smtp-Source: APXvYqw5nsLAnlFbNNBScDVik2nLDfq4pjphNbx9hl9+02D6xCIgdx9OuCZlvInxUnKDlPcejjTUww==
X-Received: by 2002:ac2:46ce:: with SMTP id p14mr5519120lfo.39.1567066128186;
        Thu, 29 Aug 2019 01:08:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9245:: with SMTP id v5ls197594ljg.3.gmail; Thu, 29 Aug
 2019 01:08:47 -0700 (PDT)
X-Received: by 2002:a2e:63cd:: with SMTP id s74mr4507223lje.3.1567066127156;
        Thu, 29 Aug 2019 01:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567066127; cv=none;
        d=google.com; s=arc-20160816;
        b=PlfesKfAgMR1DqcivdtS/llQUKPKK8RC2FTXI8Tq+VSkKZz95suQU6tv1AzP61pCqZ
         k14xnwId9e552gCUMNQ/SUe0Vc1cGhKHkB92h/U7dQrYbq2CJYfIIUacG6Hn64/HQFLC
         5YNWcZ7E+gqCGXSdm2tcepsVdVEB0G04KbdAmrxsKY04uUCqaBwCeDlhfKgTRJEiLJnY
         7dw4a07aKQOoKSe2+CKkEqnMgSEvUqKAzOd/O9IsSokp+ozLm6HLZD1jhJ9oGf7ZeR3y
         KcP2rTOb/oklJGEwaOfYD3R2F86X2n1+Rkn6FpDjY7ZJyJw8nQ4lIFtKDFgDU9g+fkDU
         EQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=gCOmfQYB5YZyGwnRNEY5q01IPJYKYFkf39TNyIg2tHM=;
        b=FFxYcYJxlJUjerK0Nl0p8YrSls/3ObE1A1pi8C5UFzpfqzQypCPGs5/cPN82lr4alQ
         b/gw68RoPahFdLbUHOfLRjnOdGETehYPmIvK1CMF8+fsCmevO8XSbBbZl3GLwb4Pq7ZT
         vomTsmO43322l+tfY80dF8EowA9O5zTXyYFGTsyUjp38oz/m8DJ9EBKH/Ovcv8Y6gfaz
         sgpPnOM6Ux8xgqLkMxlnVqNQ+KfM/VnoMnBbWnrQMKiBPBOPyim+2FJq4vlnSDpLWsx/
         Zr2uyROkYomOR2Z0ZUqepFGDO4oqzkLxR4VFIuncD8MwhoyL/1E3yut8HC/gof2TeUTZ
         RnUg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id s14si68894ljg.4.2019.08.29.01.08.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 01:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x7T88kD4001560
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2019 10:08:46 +0200
Received: from [139.22.114.181] ([139.22.114.181])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7T88jO2025204;
	Thu, 29 Aug 2019 10:08:45 +0200
Subject: Re: IO access in jailhouse root cell
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: jailhouse-dev@googlegroups.com
References: <76008E6A-1653-4358-AD31-4C8D332759C1@gmx.de>
 <fc5e2fab-3339-2dac-0a61-7a3647873a42@siemens.com>
 <7297AC93-068F-4C6F-8486-222D62F7D1EB@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a77abfcc-9856-0797-caed-0c9dcc62b07a@siemens.com>
Date: Thu, 29 Aug 2019 10:08:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7297AC93-068F-4C6F-8486-222D62F7D1EB@gmx.de>
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

On 29.08.19 08:41, Oliver Schwartz wrote:
> I=E2=80=99ve now tracked down the error to power management, in particula=
r to clock gating when autosuspend is used in IO drivers.
>=20
> The drivers in question, spi-cadence.c (https://github.com/Xilinx/linux-x=
lnx/blob/xilinx-v2018.2/drivers/spi/spi-cadence.c) and i2c-cadence.c (https=
://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/i2c/busses/i2c-=
cadence.c), use autosuspend and turn off their clock when suspended. This i=
s done using the PMU (Power Management Unit) firmware interface (https://gi=
thub.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/firmware/xilinx/zynq=
mp/firmware.c). The firmware interface can be configured to take a hypervis=
or into account, but my guess is that this is not yet handled in jailhouse.
>=20
> I haven=E2=80=99t yet figured out if driver autosuspend can be disabled b=
y some kernel configuration setting. However, I can work around the issue b=
y patching the kernel drivers to disable autosuspend.
>=20
> This also effects any other driver that relies on PMU functions. The CAN =
driver (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/ne=
t/can/xilinx_can.c) spits out a message "pm_runtime_get failed(-22)=E2=80=
=9D occasionally while jailhouse is loaded.
>=20

Interesting. This driver also exist in upstream, but not yet in 4.19 that w=
e use=20
on the ultra96. Which of the communication methods does it use when talking=
 to=20
the firmware? SMC or HVC? Should also be encoded in the device tree.

Anyway, I would try if things still work when disabling this driver=20
(CONFIG_ZYNQMP_FIRMWARE). Interpreting and moderating guest requests would =
be a=20
task for later then.

Jan

> Oliver
>=20
>> On 26 Aug 2019, at 15:13, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 26.08.19 11:44, Oliver Schwartz wrote:
>>> I=E2=80=99m stuck with a problem when accessing IOs from the jailhouse =
root cell.
>>> Background: I=E2=80=99m running jailhouse on a Zynqmp ZCU-102 like boar=
d, with additional peripherals attached to i2c and SPI bus. The basic Linux=
 system is Petalinux 2018.2 (Kernel 4.14). I can run the zynqmp-zcu102-gic-=
demo and have successfully extended it. The configuration for the root cell=
 is zynqmp-zcu102.cell from the jailhouse repository.
>>> Before starting jailhouse I can access my i2c and SPI peripherals from =
Linux without problems, using either kernel io modules or direct i2c access=
 from user space with i2cget / i2cset. Once I enable jailhouse (just the ro=
ot cell, no inmate configured) access no longer works (e.g. i2cget complain=
s =E2=80=9Cresource busy=E2=80=9D).
>>> The i2c registers are located at 0xff020000. This memory region should =
be covered by the first entry in the root cell config:
>>> 		/* MMIO (permissive) */ {
>>> 			.phys_start =3D 0xfd000000,
>>> 			.virt_start =3D 0xfd000000,
>>> 			.size =3D	      0x03000000,
>>> 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>> 				JAILHOUSE_MEM_IO,
>>> 		},
>>> Interrupts should also be delivered to the root cell:
>>> 	.irqchips =3D {
>>> 		/* GIC */ {
>>> 			.address =3D 0xf9010000,
>>> 			.pin_base =3D 32,
>>> 			.pin_bitmap =3D {
>>> 				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
>>> 			},
>>> 		},
>>> In fact, register access seems to work after enabling the root cell, so=
 I=E2=80=99m suspecting some other cause.
>>> Any ideas? Are there any kernel patches necessary for the root cell ker=
nel?
>>
>> Nope, when just the root cell runs and you have permissive configuration=
s, Jailhouse is supposed to be transparent.
>>
>> Can you track down where exactly the error is generated? Maybe ftrace wi=
th function-graph tracer can help, otherwise code instrumentation.
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a77abfcc-9856-0797-caed-0c9dcc62b07a%40siemens.com.
