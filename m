Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLE7T7VQKGQE32CPWXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7CDA1B1F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 15:14:21 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id z14sf804646lfq.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 06:14:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567084461; cv=pass;
        d=google.com; s=arc-20160816;
        b=JlDxynVSf3PZAAqmfbOLMudS+0OVNq4QTejI4UxcevPLoyfIH7X5yY7H+b+uUagAWn
         OAP8ff2geScM+2Hv5VTLBLCtilj16cYxKAsiLhdMh2KYiPyXqMEhq5jOrDQqi1eWkH8i
         3MjtQlCRrkDsIHEevRnqZX2J5i9p1DT++4zPff9ygjpIFV6bdJzv0oz+2PpKGEoZAQEX
         6jsKVV82NVKQsj4PwehC06327xd28oPJUa+YfagmfBpKAYyZm2/83SxCpdXS7XKDOXbL
         JkozbGe7ONi+lInAmvS1xKBuVCSEEYRJfynN2jrTeEcuY83OfSnBtk+UaCIfoRliGoG4
         rl1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=EWeHY8DWTyrgEzFovbhlPm9yHdvtpCEjYZIRQjVJtXw=;
        b=Duu/53tuSL2sbs/ehods8A1vlQMhd4JmizbMg+tAgIcfVmf5Enj89ldewBmi1AxlnY
         Ojt2r3Ycld29+E3GhFLlB1aH1vPL3EicRYEew3sjP6wOmT8Z2a+kVLVZsn4ygQEW7Pqd
         Ogsl1LojgdGCk9ye3WksxLBTmbw8/o4hdwVHKXSmLhYVLX55DV++uO0km7BDA+KgitbS
         SOp4EaBRss9KryLizZPI5xRlblgYIa83p6Z4K0tAqrljKsXwn4J0X7oI+XkLAu0ls1Va
         djFoPP3/QkdU8neIIIf7wGDjrmemnYJdjuvl+ODQuKIVgteXuq1W4nkCizKX0U27Tq9w
         RrwA==
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
        bh=EWeHY8DWTyrgEzFovbhlPm9yHdvtpCEjYZIRQjVJtXw=;
        b=dqqEyu95AtQ9c1BVBdb/FnG08sWOod+LTmUzgYG1+sYmI8CHtMqBoCqZRZX6q8C6hM
         /nc0SeESx0k7FTpc10tHhqxrXjgjZ3UEx++qNCfrWLQRF1g8Fkz4JGGoPScKbPYWMP7K
         HsXaQTdlc2iCiw50VJcRDGjvAC7Yy3wAJtOwQGaMk6FDq3XoDU3A5wrpxrYepWq4FQIy
         MhFUyYvXK6Nq/IT6j13Ce/QYzOA5XhanHbCNEWUCqRG5zY1wcMJO1DhtCU2lo1IUc1r0
         JyUqohVLmyjT4HtxkUu2FWMUtpj61PqRH03cNJZZe/vekCkD90kNBOJTvUiK8Fqshjq7
         nqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EWeHY8DWTyrgEzFovbhlPm9yHdvtpCEjYZIRQjVJtXw=;
        b=cRqzdcXw7OTCrD67UkB9O27Dyj0t0mg8ob0DG4p+PNHBDscLvXHijz/UwRKHAzYzKq
         JqfnBS02D+hRPnASIvfqnFip8uKXfnnhA0YLafSZrK8QoSZDfCwLbn3huH4N8JZ14NTN
         ENR2V74fsv6CRZw2o+FXvcWKHTIQQsFoRryrrdcctKXtkqmEVHOTnJ+8le902kZ685Zu
         AEppyILE+6IFmHyE/jfJTZ1l4xK5hKGITLdbflF7b04B8X2KQINz+hKbRdT7OJ9zXCNa
         8WWnAvVfxuFYnPgHqQXhiPpHHQ9+mG11hlvDFYnKW7sIgYsmKwtWNvbxDmyJDng1cmoM
         rw/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWoJNPjnFThzK1+jNlUwIBz7I8vL9XregDb5TNK7H5AoT8ogF+j
	JNCqFdgIna9RMmyPAxRUNjw=
X-Google-Smtp-Source: APXvYqz4GqCaHFEEQ/wm0defjqc64u6LQGA32luuuV7UOnh+Q8qpYwI2OTTViH8tEPeAb8VpncOwpw==
X-Received: by 2002:ac2:4289:: with SMTP id m9mr6628448lfh.49.1567084461024;
        Thu, 29 Aug 2019 06:14:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:454e:: with SMTP id j14ls235192lfm.16.gmail; Thu, 29 Aug
 2019 06:14:20 -0700 (PDT)
X-Received: by 2002:ac2:531b:: with SMTP id c27mr6285569lfh.107.1567084460157;
        Thu, 29 Aug 2019 06:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567084460; cv=none;
        d=google.com; s=arc-20160816;
        b=vHrty24dOc3hmGodLlursGtWNSLFyR+ydnN+QpV1Aw4/sfpSduUaY1fwoCrmevE9oz
         EwNUhiDj9QCjczmu69rwtLQhSp1LNOl5XKxs8iwcgcJ7FRR6wcOgNVkCCK0yDltoWRFn
         LD1D2VxiMoLZ0kfo0s2fwV5ryXl45gTBuDNPyfJcT/SpRBtyFeU2NO30SMetXgYwLuyM
         9FZe8msPCvQPY176/U4xvnMrvtIgVmoIeWQ5T8EnntHtiL/IOwSzdB61D06I20/xnPRh
         PGUOzhnIbrAkr0Ho/VuSZhOKHTeeUBHSp/HrZ6ahAffKrOokWQ1s7eGl9EcdO41LrGAr
         uGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=qvsMvavtM/vOQIa66OME6qBkj7Ouai5nGvA8elCBIOA=;
        b=Edq0jgJ/a5AdwVb4GL4f4/yTTLks3EmLRH3ksKklsPX87bu7rYA++MvVb+Dzo2msjV
         qToWD20RNBvU67m+3T9pcz6cyzVqAl6ygj71/W1QHyrEVxuuljn5oF56Brwih939sgDZ
         aFeok1gLtGk8kNyJBJLY/8me782CZk6OmPYTocRsvYl1Zxgttf4/LoQegwhOCREB9Kbq
         pppIOZkVG/6J9ImOYfzYf0jK15ehU5C9HUT7iF80NKhgl/mM04sCX4dVnBVdHeu4FqjK
         iyss+6GcDHYF8DNayABnq769EDLonOr950vCK475uHID/gCljCbEqzKbnqKacaJXa1wv
         L0kA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id i21si111365ljj.1.2019.08.29.06.14.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 06:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x7TDEIUw003625
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2019 15:14:19 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7TDEIxA030153;
	Thu, 29 Aug 2019 15:14:18 +0200
Subject: Re: IO access in jailhouse root cell
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: jailhouse-dev@googlegroups.com
References: <76008E6A-1653-4358-AD31-4C8D332759C1@gmx.de>
 <fc5e2fab-3339-2dac-0a61-7a3647873a42@siemens.com>
 <7297AC93-068F-4C6F-8486-222D62F7D1EB@gmx.de>
 <a77abfcc-9856-0797-caed-0c9dcc62b07a@siemens.com>
 <EEE90634-7719-40E0-8AD6-056999F8EEF2@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8d357767-95eb-eb14-7c0b-785f532e0023@siemens.com>
Date: Thu, 29 Aug 2019 15:14:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <EEE90634-7719-40E0-8AD6-056999F8EEF2@gmx.de>
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

On 29.08.19 15:06, Oliver Schwartz wrote:
>=20
>=20
>> On 29 Aug 2019, at 10:08, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 29.08.19 08:41, Oliver Schwartz wrote:
>>> I=E2=80=99ve now tracked down the error to power management, in particu=
lar to clock gating when autosuspend is used in IO drivers.
>>> The drivers in question, spi-cadence.c (https://github.com/Xilinx/linux=
-xlnx/blob/xilinx-v2018.2/drivers/spi/spi-cadence.c) and i2c-cadence.c (htt=
ps://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/i2c/busses/i2=
c-cadence.c), use autosuspend and turn off their clock when suspended. This=
 is done using the PMU (Power Management Unit) firmware interface (https://=
github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/firmware/xilinx/zy=
nqmp/firmware.c). The firmware interface can be configured to take a hyperv=
isor into account, but my guess is that this is not yet handled in jailhous=
e.
>>> I haven=E2=80=99t yet figured out if driver autosuspend can be disabled=
 by some kernel configuration setting. However, I can work around the issue=
 by patching the kernel drivers to disable autosuspend.
>>> This also effects any other driver that relies on PMU functions. The CA=
N driver (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/=
net/can/xilinx_can.c) spits out a message "pm_runtime_get failed(-22)=E2=80=
=9D occasionally while jailhouse is loaded.
>>
>> Interesting. This driver also exist in upstream, but not yet in 4.19 tha=
t we use on the ultra96. Which of the communication methods does it use whe=
n talking to the firmware? SMC or HVC? Should also be encoded in the device=
 tree.
>=20
> SMC is configured in the device tree (obviously, as there is no hyperviso=
r directly after boot).
>=20
>> Anyway, I would try if things still work when disabling this driver (CON=
FIG_ZYNQMP_FIRMWARE). Interpreting and moderating guest requests would be a=
 task for later then.
>=20
> CONFIG_ZYNQMP_FIRMWARE is selected automatically when CONFIG_ARCH_ZYNQMP =
is selected (see https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/a=
rch/arm64/Kconfig.platforms). My feeling is that disabling ZYNQMP_FIRMWARE =
would be counterproductive anyway, as starting and stopping CPU cores is al=
so done by the PMU firmware.

4.19 upstream seems to be fine without this driver, including CPU hotplug (=
which=20
is power-wise a nop anyway once Jailhouse is running). But I agree that pat=
ching=20
for that purpose is not convenient. Consider it more like a first experimen=
t.

For handling SMC SIP calls (which is what the PM calls are) properly, we wo=
uld=20
then need to hook into ARM_SMCCC_OWNER_SIP in handle_smc()=20
(hypervisor/arch/arm-common/smccc.c) and start interpreting the requests, r=
ather=20
than just rejecting them. No idea yet how tricky that may be.

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
jailhouse-dev/8d357767-95eb-eb14-7c0b-785f532e0023%40siemens.com.
