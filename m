Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKVVUXXAKGQEPEUNZ7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 577EEF745E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 13:57:15 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id v4sf10080884edq.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 04:57:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573477035; cv=pass;
        d=google.com; s=arc-20160816;
        b=Pj8In3rr0m172UGj5YxyUqT5ZVvKwmFaMg4Z/K3qgFD+aiEMJJgDgXqW65E/JDMCv7
         8/XDywRty3Or3s1GCxYPJnk5Fl1fShAJDBNKhRVStx2a9WnEQRJsIwCnZzwWD7dY6ecS
         pgVcB1zhyNPEn5AS+TnGySIgG78UJFQ5PxCv1ByxlLGmtaTKrJ7DhxzRRIA7FybQX9Ee
         Z2eR/if/ubH+p61oENuePx4CSxRN4f72Cs/8mYX4yQKUT8YngF1L4k+mvJG1AVfz+CKk
         qxb3Xb769Tzq4UIOSfFFJhm8VwL30t+NYVUUIivPTGNmfZvcXf08aRYXE7akCxngSA6L
         eHyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=05C5uCIxnlcbY4dzcldAsMR60CplFU/6ecIv3exCBtU=;
        b=quIiZTAEzz6UyVKaRMt8HUCzBt2gN0MB6aT8lCk6vewerxLuXdWjJ7vP8y+64139b8
         fn0bucc25kU4IUEHFYOxvrZJqOLL3iI3tgtDmHEDfhVSgKzg0RxuEZoPricJBRAG+WlM
         7KQw54mNFYwDCaQ0hj66q6CAhB/A83JtVnOUctzTDDs4GaYO7OTc6DVjU/EQDD/Crqmy
         ALtrfdPNHHAnpe5u8QknX0yOmY81P4w3aX2s6D0wqNPnBtW2hmDoLCV9hdFfG7b+HpvU
         biW/Zz3rvGShUnGMuJmL/+xF6dxP978qUN/kOHKyT7AQ0p4qJmvPT6+YUEvY1kDXlGOc
         mCPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=05C5uCIxnlcbY4dzcldAsMR60CplFU/6ecIv3exCBtU=;
        b=mZoR+rQy/lXS6+jM3CsiItRrlH0nHE/de0KvU24W+Jd0z2u9I3+iFq4d6HoBeYZu+D
         OWX9pCknIl8ONeVyG4Q7bhBaWarJ0uH6d7G020RLGqZCb5kDTB8BZj7RoWKqiHkY1OZW
         jVM4AwFHeIMbzR60bG/4eklwkPFQBmyYQekUkX+ilgzMXkAAmiY3niUhccZB8N0tcGc7
         WZg1EyCiv5xHzt3XVxLOFWgNso6wcaIcf4t08i51wqy2DwY8t+95Pf9Yv8oYN/CDPRus
         H00ipaH1KjP7XHJjF91tOSft/97Zk4my2tJMecJ8888Jc2wafahgsuvdXfea9q5gcVak
         x3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=05C5uCIxnlcbY4dzcldAsMR60CplFU/6ecIv3exCBtU=;
        b=BTi3epz5pdriT+UZD5t37mV9WS+NdJQCGoueYlST6omKFD7PKLjdpz0Qdb3cyMm3RI
         QwPrGF5Lek4UJHBjZ1Z6Ooxm6k4Iu07vHCqSFFHdXMNlVHu5mPMoqBcS31xTyzPTPza8
         jXkxhWlBB3TZ8LBLuWoL4PvmbtiEX6EOzSSeQuH8UMdRqKREq9d+++ba8YPiPKCZl60E
         cCs4PVG9tg+33AAYb5rPu85Hvs28C63NtZlCX4GCGxYwktZYWJgvtoxo+YXmivXSaAua
         tYJBzWesPGlzJVziBwMhTWvUKlZPcEBKYScccNnE1Rh2AfTT0h3Yyebb5uAf/+nKhl9I
         Ddlw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUr0R+Flmwy5Ipv9AXkAxzZJ/lSqaQtwJdc/wVPPrRCkLkPvXLa
	YU8frJO57jm9lVM5sq94oN8=
X-Google-Smtp-Source: APXvYqxE2nyBO4Xvmyl4u+/tjlvF/lbuwpfdk9wHmSqaLboVCFO3JkXdyfWbF8Tz8mZVsEaxJzrBmQ==
X-Received: by 2002:a05:6402:329:: with SMTP id q9mr11244250edw.76.1573477034983;
        Mon, 11 Nov 2019 04:57:14 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:115a:: with SMTP id i26ls2123574eja.12.gmail; Mon,
 11 Nov 2019 04:57:14 -0800 (PST)
X-Received: by 2002:a17:906:d72:: with SMTP id s18mr22737571ejh.29.1573477034046;
        Mon, 11 Nov 2019 04:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573477034; cv=none;
        d=google.com; s=arc-20160816;
        b=Xk9E7ZWK0fmH1/j2jM+W9s1NrxlUnNBWdPwxMO/Pf1HOvhMVBdlrnKkM1tJ2TNgEkt
         myNtRF4V4KZczO+ZgSGv2A5SK3rLN2dV8ZXARcw+eFdQNOAuCCsTfnb/R2W7v0pEVL7i
         qSWUpilgIwqo4setoAm05lTTmQVaARUXHOYWBrxOah2pLhfMbPiIpNKD9RDuOP77Xuxm
         ldLs48G2Jr5pH/P6czwq6eiSUXniOABAaYzQBHB1ghJDRpVQgk0dVfTeY/tE4BxmGNDe
         63RqEMRMZywvkvqOS5wCZN1pqb+10sX++gxorLfI0y+6KLRs3Z05mm3hTkOaFuGKs+ZO
         9iTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from;
        bh=BrMteSzO94K9bLUD/q9e4z9TpHyjfCvt7MJM6zB4oh4=;
        b=k7NQf57rzLdqWqr+YZixT4RiN4NXcWcFM6ZsCyZ+hGiTkwHyeR7xYOkNWl1juRhNG4
         Jrsny3Zlh+FTq8NCyRSIce9Gei0MVw5vnNdb//Q+PjHv2PGMyFP14d4KurLpps67Znvl
         duXG64hEnosyo3snhZHkz0mpWFhary5oY3RfmO0rbRnzqlVxrO+CVWtDucmuAzF712SA
         Vamew0UE6JJbFsTEbC2IAoTYCRITzGmmBng+3TXxWJJDroDigQ2nQVQvuh2A/aeAsaTe
         +Ws5qnnIOomB9ezqSeeq5KYjgwVvgvun49SgnzZYzKxe+rfBrjb3TIjgqio1qBsLhHG3
         Gdyg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q17si1724973edi.1.2019.11.11.04.57.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 04:57:14 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id xABCvCZT020373
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Nov 2019 13:57:12 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xABCvCBD010919;
	Mon, 11 Nov 2019 13:57:12 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>,
        Claudio Fontana <claudio.fontana@gmail.com>, liang yan <lyan@suse.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>, Hannes Reinecke <hare@suse.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Subject: [RFC][PATCH 0/3] IVSHMEM version 2 device for QEMU
Date: Mon, 11 Nov 2019 13:57:09 +0100
Message-Id: <cover.1573477032.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

To get the ball rolling after my presentation of the topic at KVM Forum
[1] and many fruitful discussions around it, this is a first concrete
code series. As discussed, I'm starting with the IVSHMEM implementation
of a QEMU device and server. It's RFC because, besides specification and
implementation details, there will still be some decisions needed about
how to integrate the new version best into the existing code bases.

If you want to play with this, the basic setup of the shared memory
device is described in patch 1 and 3. UIO driver and also the
virtio-ivshmem prototype can be found at

    http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/ivshmem2

Accessing the device via UIO is trivial enough. If you want to use it
for virtio, this is additionally to the description in patch 3 needed on
the virtio console backend side:

    modprobe uio_ivshmem
    echo "1af4 1110 1af4 1100 ffc003 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
    linux/tools/virtio/virtio-ivshmem-console /dev/uio0

And for virtio block:

    echo "1af4 1110 1af4 1100 ffc002 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
    linux/tools/virtio/virtio-ivshmem-console /dev/uio0 /path/to/disk.img

After that, you can start the QEMU frontend instance with the
virtio-ivshmem driver installed which can use the new /dev/hvc* or
/dev/vda* as usual.

Any feedback welcome!

Jan

PS: Let me know if I missed someone potentially interested in this topic
on CC - or if you would like to be dropped from the list.

PPS: The Jailhouse queues are currently out of sync /wrt minor details
of this one, primarily the device ID. Will update them when the general
direction is clear.

[1] https://kvmforum2019.sched.com/event/TmxI

Jan Kiszka (3):
  hw/misc: Add implementation of ivshmem revision 2 device
  docs/specs: Add specification of ivshmem device revision 2
  contrib: Add server for ivshmem revision 2

 Makefile                                  |    3 +
 Makefile.objs                             |    1 +
 configure                                 |    1 +
 contrib/ivshmem2-server/Makefile.objs     |    1 +
 contrib/ivshmem2-server/ivshmem2-server.c |  462 ++++++++++++
 contrib/ivshmem2-server/ivshmem2-server.h |  158 +++++
 contrib/ivshmem2-server/main.c            |  313 +++++++++
 docs/specs/ivshmem-2-device-spec.md       |  333 +++++++++
 hw/misc/Makefile.objs                     |    2 +-
 hw/misc/ivshmem2.c                        | 1091 +++++++++++++++++++++++++++++
 include/hw/misc/ivshmem2.h                |   48 ++
 11 files changed, 2412 insertions(+), 1 deletion(-)
 create mode 100644 contrib/ivshmem2-server/Makefile.objs
 create mode 100644 contrib/ivshmem2-server/ivshmem2-server.c
 create mode 100644 contrib/ivshmem2-server/ivshmem2-server.h
 create mode 100644 contrib/ivshmem2-server/main.c
 create mode 100644 docs/specs/ivshmem-2-device-spec.md
 create mode 100644 hw/misc/ivshmem2.c
 create mode 100644 include/hw/misc/ivshmem2.h

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1573477032.git.jan.kiszka%40siemens.com.
