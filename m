Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBZVUZKAAMGQEGIQ7N4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E39330745E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Jan 2021 12:05:11 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id n15sf2814278wrv.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Jan 2021 03:05:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611831911; cv=pass;
        d=google.com; s=arc-20160816;
        b=XvBaHZ5XJ86DOZjyCI4ixJirDyjEiMns27QvU979AMR/MdFX0UCCoXrbnkG0/LoyDU
         15Mog0gBpmPaej7upISnW2LtOC3DYQ6V05DywiLiZ4rmxs7W1Jk+4tMGB98x2EDUXrnr
         Yp2hF6pgLiOeiv9ho/7NDBRdjsTcyyZ4FdmFq0vi8OM0o3k/RQxnH33XvxY7VzqU7N0Q
         GZ2UXJaOaFSNIk3OoQiamCZJreO9f3RCtH+0iVRjsF/+TlvLPQh7CP9P3afvIfGvLZ7z
         vdlgpzEqOvF5wJ7Lc60XWkFNQouD7r1DPk1qd3P3y+SwssLW9bnFmf1VuAmnETyif67n
         q/Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=ubRTcLEbAv5lLsvbFO3q2lgM/e0W5Lix3BpWgfW81ZE=;
        b=vwd3qdu4+8P6dOwSsatIIdUWm8IloUExZxDYPSJaxA7LLFfMPI3i73KCI0PZqzucTn
         WoWVwMstRszeOAbI84GKEAigtT+znu2o7C6Jrsh0oi8h78sRQ7wgtfagBdUdxQuaUAcp
         vBKZrgMxR5sH4xA0WBY/sdz+wRONmRu1DIrmfCdP19wRcYZ7CdfrAHbAWrIdBb4NpUsw
         +RKkjPmAb6nbDkPfuC/4zODNcifVIKe8GgthbkAqraiBEDGH9uifbaVG6NbIAYCzW2DG
         L+C9yY53IDumdQ7M9JNHLa5LE1VlSVwItH41k9yHSEOOd2RqoOjFdibAOdgUM59ZYVee
         W+7Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ubRTcLEbAv5lLsvbFO3q2lgM/e0W5Lix3BpWgfW81ZE=;
        b=aNY0Exk1EP7IzbIl29wuN3a0J4HBGaczfjM53Pv2y6/7irurThwE32TB2qHM/1pluu
         vOQfeHpfTdM1EgSzKs8kzEj2jE3b+9kRE3vLzds9R0fU6kUfzCG3Sca1Mn1NwGgA4WGb
         TNU4ArPBBmQhAHIYKfKbRA0Um+p4e0xFMMIwBd/vVmcunvTFoxhx6BHs9T/5pOH8H/Lo
         INy4TRmt4ZB62I4bIPyniDfM9UZ71um8cb4FgSZMXpaCXG/U6/EvMtUfoxO8JzAHzW6i
         /NF8nxfgDp0HA1uyKBVs8//r2BUXAZS4/MIBZzSD5qF6kkAPNtFNSyMwo08CcF4TzLEo
         9jKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ubRTcLEbAv5lLsvbFO3q2lgM/e0W5Lix3BpWgfW81ZE=;
        b=UcxT0ru6AsxdJyZf02GpechRACNEa2/X9BIv3YLWjSren2pGKGl6fsV8TLToxPzcD5
         DwK58CpYEN+3E8mhxWnAEiPDDtwycCY/4T8yI21A8hA2S7otqiztg3QnUd5CTqNg/y/a
         ksR//BBrJmPHrBr0whOTBUUzTR5XfFJALdviXF8CxxJVomGodB4660SL3GznQUjEvahz
         Jr8JuD/KvzK0EX8qYx1cNQYeZywOczzg2L9dGASonCI/dvGR3PfYj32MX5qB34ieEuQV
         qQntnVUvVnYVX7tP1Hdz3K0t1X1Mrkvppbw4dwO2hyOmKx15701bKaRl7KbhdDR/BXwB
         skww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533UWuB7/g7oHgt3QHtessNuEReDPdx6U2aSw3nQWX9rnTFlzROS
	XdK6Al5dYWJpXwfXeK6GBAE=
X-Google-Smtp-Source: ABdhPJwGkNtzTJdS+sViJ4qgw/2Sytiqvqel6jOXw5355K3Fm7PGsZE/ay2lvW0HsnZQAVBGe+3ykA==
X-Received: by 2002:a1c:9c84:: with SMTP id f126mr8463261wme.152.1611831910936;
        Thu, 28 Jan 2021 03:05:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fd09:: with SMTP id e9ls401972wrr.0.gmail; Thu, 28 Jan
 2021 03:05:10 -0800 (PST)
X-Received: by 2002:a5d:4307:: with SMTP id h7mr15801339wrq.353.1611831910061;
        Thu, 28 Jan 2021 03:05:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611831910; cv=none;
        d=google.com; s=arc-20160816;
        b=FF5q91GyOrRFgKKPADBdpY2r9XJveZOJpu5QHlsNvRMzsuHMAHOeSE0qVSXLVgcDfY
         pg4BF7xP+n8KEwPkuHmTUQCXeuws2AE9a2gf8/35I2MCpst9l5yVTYBob+MNDXlvItuy
         OQjZzAwrFxn6UcYdygFQujJ7n+4e7yeJFJo13gNSdsOTLBFMYscEm8Wya+jyNd8TwZo5
         TgylRyQuMYBqG+QjNZqCsPr43rCmOx7J4zA9BW7biVrv4loFqfDPuuFrkjw5mcRzEy+A
         pUJtCw2oOuJMZTZKm8oEu4NqJ5AIWCSIpdQcVDbNScECRQ+C843/jDfFHq53aQ/0ahHO
         fO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=DqGGAf9PlERHDqEh2tsTr4TNhO4773VREl2M4py8VCY=;
        b=An3J2FbijceKG2VDWY+0J+eG18zDFUFATdXIuK2OJVasrTP+Rrt5Qq3WXr/CJL6Wkh
         +RKSlwb1wqgUrb2R1yxFlgKL3ulO89JzxKJsNPMlXYr1LL6annhS5fZ4OUx3ynn11jHP
         tdcoQqp5qfcJMh/S3KHZVzJbXgNlb2wrng8pMnkF0xLXZgBaWnBg7897P4hDturyXQjh
         ipZMlwr08hhTEwWUM4ZcOUYaqyJv2TIsJgvkSw2jyB7XZ1KdQdLd/uzYH0gePaTSvGTm
         xJr3hMLlLmgSBdfxLr/Jbrs+Qq63mmQ7LTBRADFfSgaY8DQtuFf/uLr8rZLOOSiaxfY7
         5+wg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id n7si337579wru.2.2021.01.28.03.05.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jan 2021 03:05:10 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 10SB59P0013866
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Jan 2021 12:05:09 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.63.187])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 10SB59KK028534;
	Thu, 28 Jan 2021 12:05:09 +0100
Date: Thu, 28 Jan 2021 12:05:07 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Jan
 Kiszka" <jan.kiszka@siemens.com>, Alice Guo <alice.guo@nxp.com>
Subject: Re: ivshmem-net issue
Message-ID: <20210128120507.7d719105@md1za8fc.ad001.siemens.net>
In-Reply-To: <DB6PR0402MB276057E778B7AE525825373F88BA9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760C0BAFC4117D229FDD5E888BB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
	<20210127195845.348673a3@md1za8fc.ad001.siemens.net>
	<DB6PR0402MB2760E2A8D41ACC217410A85388BA9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
	<20210128075935.648f6522@md1za8fc.ad001.siemens.net>
	<DB6PR0402MB276057E778B7AE525825373F88BA9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

On Thu, 28 Jan 2021 07:03:51 +0000
Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: Re: ivshmem-net issue
> > 
> > On Thu, 28 Jan 2021 01:28:32 +0000
> > Peng Fan <peng.fan@nxp.com> wrote:
> >   
> > > > Subject: Re: ivshmem-net issue
> > > >
> > > > On Wed, 27 Jan 2021 09:08:28 +0000
> > > > Peng Fan <peng.fan@nxp.com> wrote:
> > > >  
> > > > > Hi Jan,
> > > > >
> > > > > When booting inmate Linux, I have ivshmem-net configured. In
> > > > > root cell it shows as eth2.
> > > > >
> > > > > I monitor system network, and see eth2 is assigned a random
> > > > > address.  
> > > >
> > > > This is not "random", this is where some dhcp-clients end up
> > > > when they do not receive an answer to their requests. It is a
> > > > fallback when there is no proper DHCP server and machines still
> > > > want to gain an address to potentially communicate. (zeroconf
> > > > APIPA)
> > > >
> > > > So it is worth checking the DHCP server to see why it did not
> > > > hand out an IP. Maybe because of the random MAC that Jan talked
> > > > about.  
> > >
> > > What do you mean DHCP server here? The eth2 is created by
> > > ivshmem-net, it has no physical connection.  
> > 
> > Well if you do not have a DHCP server in the other cell, you
> > probably should not be running a DHCP client. And looking at the
> > address you are running one. You probably do the whole setup on the
> > kernel cmdline and that works until userspace goes and configures
> > that interface as well ... again. You have to tell userspace that
> > this one interface is off limits and already configured. How to do
> > that depends an what is doing that, probably nm or systemd.  
> 
> But seems we are not able to differentiate the ivshmem-net created
> eth2 and the physical interface eth1?

You can do that by name. And if that is not stable enough you can do it
i.e. by driver or vendor. Maybe with an udev rule. For starters just
disable nm or systemd-networkd entirely and bring up that physical
interface manually.

On the kernel cmdline you can specify an interface name for your nfs
ip, in case the kernel picks the wrong device.

Taken from an NXP ls1043 lab setup of mine
root=/dev/nfs ip=${ipaddr}:::${netmask}:${hostname}:eth0
nfsroot=${serverip}:/srv/nfs/boards/${hostname}yocto,v3,tcp

Notice the ":eth0" at the end of "ip=".
https://elixir.bootlin.com/linux/latest/source/Documentation/admin-guide/nfs/nfsroot.rst#L88

regards,
Henning

> Thanks,
> Peng.
> 
> > 
> > Henning
> >   
> > > Thanks,
> > > Peng.
> > >
> > > Or maybe that  
> > > > MAC was taken and the client did not have a valid lease for it.
> > > >
> > > > Henning
> > > >  
> > > > > [ADDR]4: eth2    inet 169.254.232.89/16 brd 169.254.255.255
> > > > > scope global eth2 valid_lft forever preferred_lft forever
> > > > > [ROUTE]local 169.254.232.89 dev eth2 table local proto kernel
> > > > > scope host src 169.254.232.89 [ROUTE]broadcast
> > > > > 169.254.255.255 dev eth2 table local proto kernel scope link
> > > > > src 169.254.232.89 [ROUTE]169.254.0.0/16 dev eth2 proto
> > > > > kernel scope link src 169.254.232.89 [ROUTE]broadcast
> > > > > 169.254.0.0 dev eth2 table local proto kernel scope link src
> > > > > 169.254.232.89 [ROUTE]default dev eth2 scope link
> > > > >
> > > > >
> > > > > And also in route table, it added two entries going through
> > > > > eth2, I not understand why it will add one entry that default
> > > > > use eth2 with gateway 0.0.0.0 #route Kernel IP routing table
> > > > > Destination     Gateway         Genmask         Flags Metric  
> > Ref  
> > > > > Use Iface default         0.0.0.0         0.0.0.0         U  
> > 0  
> > > > >  0        0 eth2 default         _gateway        0.0.0.0  
> > > > UG  
> > > > >  0      0        0 eth1 10.193.102.0    0.0.0.0  
> > > > 255.255.255.0  
> > > > >   U     0      0        0 eth1 169.254.0.0     0.0.0.0
> > > > > 255.255.0.0     U     0      0        0 eth2
> > > > >
> > > > > It added the eth2 route table and will break nfsroot if we
> > > > > using 10.193.108.x for nfsroot server, because it will match
> > > > > the 1st entry.
> > > > >
> > > > > This is not jailhouse hypervisor issue, I just not sure the
> > > > > eth2 behavior, it is systemd does that route change or we
> > > > > need look into ivshmem-net to avoid update route table when
> > > > > creating eth2?
> > > > >
> > > > > Thanks,
> > > > > Peng.
> > > > >
> > > > >  
> > >  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210128120507.7d719105%40md1za8fc.ad001.siemens.net.
