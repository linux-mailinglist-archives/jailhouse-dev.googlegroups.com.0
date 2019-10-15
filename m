Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT7FSXWQKGQE7WHYS3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FC5D7006
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:18:40 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id c90sf11560347edf.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 00:18:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571123919; cv=pass;
        d=google.com; s=arc-20160816;
        b=WKRIRWbXkNt5gguYq+3YW/gO591ZTVk4zds6rG1xYyJoBKSgmZGxwRfN5gOzoj91et
         BSw9uz50oFtO6QkP0AKSvyOSZWcVzKaas3HdIn4I9UYPKl1iuKNf1z9kFqsaT7MErlT0
         ziIL/S+XSX7fixUOo9w7DfXmbFOVA+lAU4ya7y9+Be9RRAMpgwpjLzzXLb5PVrat1L6+
         XbJ5lwaPoPiDqOj61y2iQOmXyej3xF2uLAxiNvP6NFAWu00GSLL3UPj6Nmgz9PbatG/1
         HvKMqBbHOwsPjvlCSp6pfOKbH0ziqas9tvO9seRnaugOj24Se583Bhf/YETAjg8CNc+N
         3mDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=cRkCH4XI7RV6/Dldda0ZJDYsh6r7v6D8todqR5bnwaE=;
        b=CNjlJ+E7xE6PjydZm3oZxCTDVQj5U0dW1o+Dw7wTMF1RtvOpqfxBr1iru7cAg+GTcC
         5NUSE8NwOtsVqLfGA7MeEPCwybCyqyNro8SkEXLpZLxw4AZ45jnCujyMMyj7QTjT7MX4
         wbn2gwqtYziMPJR090J+aOXQUC9/TT05F4br2+Jx8DnDEc4tuNQeKw0bIgzg5n+JBIWA
         zWB5Q7h4Ph6AtNhbfR+imXXKUEzc/IypvKt/lzuxIjUyju/thmn97YWlR8qZmHfxYNZl
         h8tnB5p+238P0E1r0eNxEsyS01UH8Lyan+bB7g7Ow61BERJWzjIJCXHfLfbl1jOXTS+C
         tGWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cRkCH4XI7RV6/Dldda0ZJDYsh6r7v6D8todqR5bnwaE=;
        b=ifDyAjcJtlhN29svfMxvIy+vPszErt44ExQL5H29Cf9prESJkpEYnjWyhJHDD1ZBBo
         ZO+eLdm1I8cU0ccraJs7PU1GUYqKRMcunxbpxW+utXDccsId7yDShVcW0amQO79T+0ho
         F6AXn+LmMapQ6F8kbeOqbJ1RmNylqPmATg8GsrhE7w5C+iItdT+Wi2TFNq9nsAPjJiVZ
         AgkpyUkKVtwdoQdGVsp2UJTqN0i0xSHi9BnZuN0XrTh8FioVxL7Gqht33Xvi0FV6eim9
         GQhNP9cKBEsGnbRmK3jGhCA69UGMP8nW5OtmvCewNC/tM2UyzVvVtCk/DQMb1MN3caUp
         idFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cRkCH4XI7RV6/Dldda0ZJDYsh6r7v6D8todqR5bnwaE=;
        b=WSSR4D2vsJXO6SjxtWxy86hiMIc5kgnK6zIuFJGrhZDZRxOML9cHKbvR9APPOyvmdk
         3H9F0fSMAGHrt2TBeOPQrit3GdPb6ktlq32EbhgdR/sYouGdSqFIUI14+Cqp6uUy/bAh
         fF7ItGpHJM7nyXbnkiyCxyfYEMgPv/sB2GxJRmrKp65/prUWv2RO+4gOjBjcQ/nDpLXB
         Cf4MC28X32xjycDFTp7RnVmTn1ttPnd7OB19hSmI+8gH5+Qli8H8Il+B7vj+e2gAwP2N
         8jhlrvC4hMYYeIMVyLSW4bRwMQloK/jJ/VhMi3/S5gZcVazvnEYDXjedYgyX+SnS4+gR
         IOAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUTQEMnIQPLWde+J7V73P5x822A5AicNzjqjZxzDmoGs90Lekx8
	fuN2vW/WF4VbPPAOl4NML14=
X-Google-Smtp-Source: APXvYqz/v+2sPvCXMZEp8QqprtP/s5DV4eDmOgGm3ZBY7kyi7ps4Sq6Lic5KCp6Psi4adIV4oODg4A==
X-Received: by 2002:a05:6402:1514:: with SMTP id f20mr32253284edw.35.1571123919692;
        Tue, 15 Oct 2019 00:18:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d151:: with SMTP id r17ls3970071edo.4.gmail; Tue, 15 Oct
 2019 00:18:38 -0700 (PDT)
X-Received: by 2002:a50:d70c:: with SMTP id t12mr32179740edi.252.1571123918945;
        Tue, 15 Oct 2019 00:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571123918; cv=none;
        d=google.com; s=arc-20160816;
        b=iSCaBHcIqewmxMQ3q42f67u1Sbkf6S8MjMZHviqn8x82s5yRktybGysSWPl9NGrO2I
         Mv91dr7vNhKoOHtAV2IhJECgXENkiVCEpYEovvMlEw74oQI/hHOvH9+sdxMeAZrpE3h2
         mEUsnm3EICBICQHCB6hZ1CRlsFxKjg/6TQb/omVQ6W3o9Vr4zyTINug9dm2ytKl8aAIf
         XCTo62AUOR1yePNh+ceM9WSDWJDZlk/brLoXrBddufy+P1MhvHFM9NN9BmeK085tu48G
         bfqMNw1xP6M3N29Ex71rS2wmw69OyEX0NcqNYX37H115x8ocWwAcxUCKF02l/O1+44sf
         hduQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=+TlqrD3Nrve31WYwAVYH3D4lj+62pSIDO04kybJXyLE=;
        b=dDYLx+F2DNHPA+6mrB4V7xguuJ6yj1hwE3bJkFou1uXd/SIPkCG/HnxS3SR7V2+6eC
         zq4RC6mUtGzQW1QY3XX0u3OMfO7uR0eolXwyzoRrspG+FlMIZqkNuzSSUcrAGm0Vkn8J
         5I5miLaC+Xay1vKkELO1TU2yTNKGBWt1dl8FjR2UgMAWFXYIF+ZNqDpOAUh50z7UqNDW
         48PyfrhjSWWECW+mv43QwCSIKAXDzcRQkSSGJb+NWHY98I7UFpvioIxFqDYAYCV8DwNH
         rmcQ/9pzetnJ2d9tFJVg9hz8JAJPSbW+EiV41mkIUMzt2La+/QwndCuLIBxaXeXf/tZw
         Uf/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id a27si946602ejg.1.2019.10.15.00.18.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 00:18:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x9F7Ibtj005474
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 15 Oct 2019 09:18:37 +0200
Received: from [167.87.14.144] ([167.87.14.144])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9F7Ib3T011924
	for <jailhouse-dev@googlegroups.com>; Tue, 15 Oct 2019 09:18:37 +0200
Subject: Re: PoC: virtio over ivshmem for Jailhouse
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
References: <85f868a4-bff5-567b-fbd1-22c79406ad17@siemens.com>
Message-ID: <603922dd-251c-b4ad-f4a0-1397f753a25f@siemens.com>
Date: Tue, 15 Oct 2019 09:18:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <85f868a4-bff5-567b-fbd1-22c79406ad17@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 14.10.19 19:04, Jan Kiszka wrote:
> Hi all,
> 
> it's still basically a PoC, not yet specified and with a lot of sharp
> edges, but it works too well for not being pointed out:
> 
> The queues/jailhouse-ivshmem2 branch on [1] contains a virtio-ivshmem
> transport driver [2] for Linux front-end guests and a simple virtio
> console backend device model [3], also for Linux. Combining that with
> the wip/ivshmem2 branch of Jailhouse, you can call in the root cell
> 
> # echo "4a48 4a48 4a48 4a48 ffc003 ffffff" \
>    > /sys/bus/pci/drivers/uio_ivshm/new_id
> # virtio-ivshmem-console /dev/uio0
> 
> and then start the Linux demo inmate which uses "console=hvc0". You will
> both see the (late) boot logs and be able to log into the guest, like it
> were a serial console. And all that without touching anything in
> Jailhouse (beyond generic ivshmem 2.0 support)!
> 
> More to come, latest at [4].
> 
> Jan
> 
> [1] http://git.kiszka.org/linux.git/
> [2]
> http://git.kiszka.org/?p=linux.git;a=blob;f=drivers/virtio/virtio_ivshmem.c;hb=refs/heads/queues/jailhouse-ivshmem2
> [3]
> http://git.kiszka.org/?p=linux.git;a=blob;f=tools/virtio/virtio-ivshmem-console.c;hb=refs/heads/queues/jailhouse-ivshmem2
> [4] https://sched.co/TmxI
> 

Was too easy:

Welcome to Buildroot
jailhouse login: root
# mount /dev/vda /mnt/
[    8.968669] EXT4-fs (vda): mounted filesystem with ordered data mode. Opts: (null)
# ls -l /mnt/
total 12
drwx------    2 root     root         12288 Oct 14  2019 lost+found

You just need [5] and this to make it happen:

# dd if=/dev/zero of=disk.img bs=1M count=64
# mkfs.ext4 disk.img
# echo "4a48 4a48 4a48 4a48 ffc002 ffffff" \
   > /sys/bus/pci/drivers/uio_ivshm/new_id
# virtio-ivshmem-block /dev/uio0 disk.img

I've updated the Jailhouse wip/ivshmem2 branch with corresponding cell 
configurations.

Jan

[5] http://git.kiszka.org/?p=linux.git;a=blob;f=tools/virtio/virtio-ivshmem-block.c;hb=refs/heads/queues/jailhouse-ivshmem2

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/603922dd-251c-b4ad-f4a0-1397f753a25f%40siemens.com.
