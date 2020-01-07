Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7VO2LYAKGQE6OOVK6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6EA13290B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Jan 2020 15:36:47 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id x79sf8318551lff.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Jan 2020 06:36:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578407807; cv=pass;
        d=google.com; s=arc-20160816;
        b=0awXvTwLtEQgsoeT2j8trMKCbEpHLFmBvQ1NBpVqILHJi4ELf+5xzVgBPjl1s/VD3C
         U+BnMyWYuyjm0VIT8Po8ikPN5dr4N5EdDtSC4kXLjk7JDbq7LCfqam1BXyzeJoRvt1oR
         kauOyrMiM79sQvlfDtFwuQkpKYuRYnnR/H5kuPy6bXxP92rzS3KR4jrBz0UV9JSAdoLc
         B+7R0XKKPuc0ZBCKXWQFY8ikKfHKjmXZx6BIdbccpeTt5AoWo9KYrbOo9BmjYpX/6xXU
         L07LZSJx7mevk8FfI1b5LhYchozwPAp57Nz9OIssB5jeE/bGawTt7dLD4BXOAT/hTVVn
         LpOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=G4yYs2mF1Fzl1kZ9842l+fsz1kLtz0MrfWnwEoIodEg=;
        b=I9fZiglkKO4J1cubsKOfgQA3DPXHyXHMnXWiLwixTQo4y28WUrjTi7YyObkA1O4VL0
         PTmfcY96kOhr6Dk1Xh7Rd14qjR4P4HjhW0yJpIG/yfypnLDqsZ6KScSXVamgY+vLqGWS
         T1FoThrQenXJnDN2oONEN/E5XhYcl5eRaUJtkI1QTBfyr37AJJ6p6f0XP/9qyIew6WPW
         CXxOZer/POjbQLv67yCCmOyF++H59xjJNjHjw9QnwzTZwekrTa2Dbl4MM9ieQ0qAUiwY
         6Qy+6NHMhFnrlJoGjhH0HExPgnVISuxQ3zZ7U4k7xreaklLGk7wZif++oRJ0ntei3WDz
         pEhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G4yYs2mF1Fzl1kZ9842l+fsz1kLtz0MrfWnwEoIodEg=;
        b=iHktTuus8zWP40RjBlu9cNCakgC+OkMzzfluSdUX9NeUTMQm6DTcw7qq+Y/kQ0vvxf
         G1Qp94FUDLWsEIRRA2byNRBvXhRTgN2zOHA7Og3dKayUNrPAhvWK61Jc5Ik83t0VpxxW
         87+jv4zrAvOHgGxwrVAgi+C+FaWH4gDvofr/x3aYlvKmIOxhmdov30M34+uSML4Xnb1J
         Shs7koBwGc7eJ89LHfQMUDdmTU++2vSi3FjUhU+eNIlTxvLzSsSTzaUwBmruypeizMaW
         3oUXcMd40HPNQfpKOsvuYFibBdguYm7ZmfsTelCNWOd/92dlewIsL37zSiMg8Y+5bzK8
         M4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=G4yYs2mF1Fzl1kZ9842l+fsz1kLtz0MrfWnwEoIodEg=;
        b=IVQK3AmIgyZJrFpJHKMvZLxdtQ5pkcbSzWLkBE2piE1UphfxobTAq7r/kv9DVWsA/3
         mBci0/fcN8tLGhZiW3TZR5mzrrDCYIW8V/kEIW4LJhSojiR6Pp8TXLKMsJJ7V8BsWpYN
         rHj2P9BrpEKg/55SIGtier9XKh+f1micsskHXyXhGjjiC/bLfnrblT/q5vML8sv9iUTK
         MNS8LVa+gphIHL9JWCfx0bSnf1Tu2EVR5MHrIpC8TQmZFMPrm1u2PI0pId6m5hUWzLZT
         v/XXA6L1zD/KamGbbaiwb7aJjusS6TqMAaGNxzXICn0C4YHczUvk8jNgyoPkk2DVV0xn
         5CGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUCVZwK2uI4xsfZ5P/bFgo8MlPND0tWn6tUdKQ1ru1D1ZmYALIg
	whsPFN2xFIeWR/QVKhxEGX0=
X-Google-Smtp-Source: APXvYqwb5TKCFrk5W0rOS7MZ+RtyT7HbpmXpGXTPz9KwRlbxaJZS3O/ROLXYKrLIJ9MKKf68onOAXg==
X-Received: by 2002:a05:651c:106f:: with SMTP id y15mr38484845ljm.63.1578407807044;
        Tue, 07 Jan 2020 06:36:47 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:44c8:: with SMTP id d8ls4452806lfm.10.gmail; Tue, 07 Jan
 2020 06:36:46 -0800 (PST)
X-Received: by 2002:ac2:5605:: with SMTP id v5mr61547597lfd.136.1578407806170;
        Tue, 07 Jan 2020 06:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578407806; cv=none;
        d=google.com; s=arc-20160816;
        b=cAd7Th5RGFsOaGC/BydpbuTYLLnYL6AOGB2T9EhV+KAHkJ8FiYoeZpXMnXVOwvw4ny
         etn+K6sHj9lNWRr6yKNgS6K7/sgGwuMjklGSdqMIcNT0IRWNn8+XuKPPvKrOKEbxg0Pq
         bpS1fSfVbGMYvN4i9lVtRvJgyRT1EbbmEK3zCK1TkvFNQY/O6D8velUd/bAYVq1nDELo
         DMDOAlvC+2MpA9Z7jtsexMpgQGeKyuNf4NwwXsIDjFMM8xeWpR9A7ZVz4yojpFwT8v6A
         PVh/gXY0n/A7Jr6+c9EwwldnCv2PwhJUrFbRmV4mMHB3W7II+4rxU3yILJc8ZtC7d6GL
         lMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from;
        bh=igtxxzN7x1QbpNZszys1Y73VjguYb8e9RXmUIz5hj9Q=;
        b=pXmmW818f3s29KmZEsVtqzxA1yujho92JMen8seDKxjQnwWtqe5q2ADKfxbE+Y9CMA
         KrKlcQ2aOrTL/GOeW7HdJtTHLGjAOsY5Of72Bvfk5WndyrmQIfUbxr32nYwpYRUOPkrP
         WZyqQBWTwFMphj0843JD+RV2f50inr6pfaWfLY7VQ5p6FreXtSUxfYGmTchJm0gjGCHh
         iwLXQcW96mBLT1j7KwSmXBYgT+RuYlqfR7W8sowNFl+iTCCxICSimaRle2ceEZzfm7py
         UF+1KjQ11itIACNORY+eNrIHiCK7+Jafo5qVPVgR+tIAtFq0YhyERQwvdX0+ot2SEAEW
         BEXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id c3si1817541ljd.1.2020.01.07.06.36.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2020 06:36:46 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 007EaiNQ008533
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2020 15:36:44 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 007Eai7Q011484;
	Tue, 7 Jan 2020 15:36:44 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>,
        Claudio Fontana <claudio.fontana@gmail.com>, liang yan <lyan@suse.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>, Hannes Reinecke <hare@suse.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Subject: [RFC][PATCH v2 0/3] IVSHMEM version 2 device for QEMU
Date: Tue,  7 Jan 2020 15:36:39 +0100
Message-Id: <cover.1578407802.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

Overdue update of the ivshmem 2.0 device model as presented at [1].

Changes in v2:
 - changed PCI device ID to Siemens-granted one,
   adjusted PCI device revision to 0
 - removed unused feature register from device
 - addressed feedback on specification document
 - rebased over master

This version is now fully in sync with the implementation for Jailhouse
that is currently under review [2][3], UIO and virtio-ivshmem drivers
are shared. Jailhouse will very likely pick up this revision of the
device in order to move forward with stressing it.

More details on the usage with QEMU were in the original cover letter
(with adjustements to the new device ID):

If you want to play with this, the basic setup of the shared memory
device is described in patch 1 and 3. UIO driver and also the
virtio-ivshmem prototype can be found at

    http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/ivshmem2

Accessing the device via UIO is trivial enough. If you want to use it
for virtio, this is additionally to the description in patch 3 needed on
the virtio console backend side:

    modprobe uio_ivshmem
    echo "110a 4106 1af4 1100 ffc003 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
    linux/tools/virtio/virtio-ivshmem-console /dev/uio0

And for virtio block:

    echo "110a 4106 1af4 1100 ffc002 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
    linux/tools/virtio/virtio-ivshmem-console /dev/uio0 /path/to/disk.img

After that, you can start the QEMU frontend instance with the
virtio-ivshmem driver installed which can use the new /dev/hvc* or
/dev/vda* as usual.

Any feedback welcome!

Jan

PS: Let me know if I missed someone potentially interested in this topic
on CC - or if you would like to be dropped from the list.

[1] https://kvmforum2019.sched.com/event/TmxI
[2] https://groups.google.com/forum/#!topic/jailhouse-dev/ffnCcRh8LOs
[3] https://groups.google.com/forum/#!topic/jailhouse-dev/HX-0AGF1cjg

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
 docs/specs/ivshmem-2-device-spec.md       |  376 ++++++++++
 hw/misc/Makefile.objs                     |    2 +-
 hw/misc/ivshmem2.c                        | 1085 +++++++++++++++++++++++++++++
 include/hw/misc/ivshmem2.h                |   48 ++
 include/hw/pci/pci_ids.h                  |    2 +
 12 files changed, 2451 insertions(+), 1 deletion(-)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1578407802.git.jan.kiszka%40siemens.com.
