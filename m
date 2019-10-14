Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKWVSLWQKGQEA22RBPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id A0429D67EF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 19:04:42 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id n18sf8738255wro.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 10:04:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571072682; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q3NAkjIA9JsBXf5FKEaIcYir82TP28gzroQgSU3iya0SqzLVhm4yxKhI/GUQMl5Jg5
         2uRSmxPjG4ImQxp6i7+nlGl0L7hA9hc9WTxITtlg5Ruud1uCOihTbLC2sSPhuUcSp0aM
         2bHU6m5BIL/qyIA/XIx77sDDkRhPonueyI+QHXEIM1KliOj030Z8ybxxLZ5UO8VfxYHN
         QrUyovKu015tMpmxTv+FsPuWHcS9F1tLR4UeiVDHlAtuR3EXcrbl+072ni3+z4snF3hB
         tQnoYM+BnayzWtP2UeEFwK9BLURCyjGjR/LVTpzBcl/EZoluQr19KtYoUOTQqYPinPSs
         zReQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=WX+qpvI+iI4GoOeU69t/qxpwFN0nmnN7SjMEkGRcVfc=;
        b=qiXyE9idcy3XP8KcRlfb7Bx04uYSjeO+YhclI1v8rs+kXdwPJJJQB0KNgH43zhmrtM
         UCQuAoy11bURa+xQHs+sDubDcrMxTzEQ3IlWsPqdyviQ5ppWJXrwowR628nDJ35MzKtA
         VzoGiKqqepahe+qm4hVpBv/KSkoPzeHQQf7kj7ltYpmbThS7V3oxZ3TKt7pD56fsIFa8
         aHf5O55f8HtUbLvvY9PU4HKzvnLC+y1gQGLSKyDfj2bGT6B4th8L5x+CGw51I1yRW/ZO
         xDBcsSpmvEnDDAFu9Ar2ucpduwKWBzPCiTxIuXqPs6FYg+iDgUdpn41MWQgYcPxfm3wm
         cr1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WX+qpvI+iI4GoOeU69t/qxpwFN0nmnN7SjMEkGRcVfc=;
        b=LAU/5N6I3ck4xUgJcRp8nNA8tjnAs+GGiwupBJvbVUtBrk9tICe94UNkJ3FCMd52fy
         30SBtRZvPU1BlVZ3EZ9lW076tl9zulA6bpo/Q/PKFMR2AXA/HjSMz0BVg0f18FhpWtHW
         zOvV/Ip3Q98lw3ghwWYaGDzblKC7eFySTCofsvvEjHheQeQRuqePtQ0tcHXuBexN4YMq
         rkW1VjzVbUhw9yv+XM67cLHWneEZyFgI/ir68oxG98rudyA+aGIHq7XEmWc9qhsGlT2h
         5Pxe8OPqZ1WVZ63cd0PFY8ynn+atvX8py2m40HvH1OuW4gHihb+GK8fCg1aUgjzOblna
         ggvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WX+qpvI+iI4GoOeU69t/qxpwFN0nmnN7SjMEkGRcVfc=;
        b=avqHkSn+OsgT0aWORlBNR179mZ6r8xYK3ZhHePvry79+MwkW+ZY7xArVCtgsX2S8F4
         f+y8f7o+zQ1rg/Hs0O1UvufO2aK/IUz0j3h03NXXreFimdnUOWI/W3YmFa5LqZBbaeok
         a8Ir8XoQ/0BgWbONwgK2nGXb4jG4hXFdR2Fuxah60Xk8xMBRIEctpmag+yTUh+yRR8DQ
         OCGS2g1WZJvpTO2CZgfcOGcBSpqqrVehiUtpLQ5wRhuB4G8rfnlwpdCerlFcRo+SQ11m
         wHNJnFGVdTJgb+WoqwnnmCo/lXVK6PQHk8hMNU0AUVWtxtnx95lDiBPE2aUHlEZibPDw
         YuSQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUzrBr5PuomRhlbLt2wLHfr8jSmrN3dkiYz+udPdgBeKCYR9vDy
	EdzM1iP3saKbvuK/mLbOBQM=
X-Google-Smtp-Source: APXvYqxABut6N3YSZUek9JOmPlVdw2cycuSsG2tvdRKSf+DS3zXKSLbm8kGIcR+eAzfWu3AxyHdeoA==
X-Received: by 2002:a05:6000:112:: with SMTP id o18mr28394709wrx.323.1571072682343;
        Mon, 14 Oct 2019 10:04:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a78e:: with SMTP id q136ls6456804wme.1.gmail; Mon, 14
 Oct 2019 10:04:41 -0700 (PDT)
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr16695400wmb.127.1571072681560;
        Mon, 14 Oct 2019 10:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571072681; cv=none;
        d=google.com; s=arc-20160816;
        b=E688K5+nw/Mq1vDESZnRWrNLDRfi/MaAmJFm4wDn7gFF7cL0Epz1LtxahJ91TG5eUO
         cmSOf7YXA/oDMfTAFt6hbHND9PpSmhUoJJps04z4RrBqj/pwmD7cGJv5FhFMchtsOVql
         LCNYA0aAHMFIyv2SMhBcxoTlYDNWyaQ6/4bZhHptd2ztWx8jeZ38wmtZQY91z8xSJK32
         0KukxFbbj/cvM5g5wVVpb4A4CKX7MbALyhzOEKI50rd6/ql6zQUzRzNWsYj/dUNBdjpd
         Rki7hCx8hyJRt1Wf05fANAIIO5JZxtOWJS0qbK3dSFM+p7QJLOod+1dQLffxfgoaXt0u
         6qaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=tfaj0wXwxBiD9R9fkDACOQ7Jh9E6BYr8po3jozRvMTw=;
        b=DCHNraXBhF+r8cM/w0uF9kwmEY+ZvJI5OVTQlPxwQ21d09M0I+J571aVLeFcTX+8cO
         tuNQ6f3lH5u7QLqyzDKyGyAz7YWa9kNXfeHJ9wQNNaBNgzUV8rpZjqiVccAv3tZaf3N6
         dNIRWBCl61K4rBMTatKHudcrm/VhIH4GZHlPdliagr3sC/xr+RVjMgWElw3SRuzw00cG
         zW1No1PxFOW0ebipCjXO4kOjTkPE7nvUTFK3sLCt/6gmdzw/BUaW7RVfgZ0jPu+SDehB
         Yk+4vHt7JNz0vGxemzo+KiMsFMUyTXtytvkjdxNtqELen79Coj+59lA66eVgcVkKz9BF
         unVg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id l3si34406wmg.0.2019.10.14.10.04.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 10:04:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x9EH4f7d001290
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 14 Oct 2019 19:04:41 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x9EH4fnV008975
	for <jailhouse-dev@googlegroups.com>; Mon, 14 Oct 2019 19:04:41 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: PoC: virtio over ivshmem for Jailhouse
Message-ID: <85f868a4-bff5-567b-fbd1-22c79406ad17@siemens.com>
Date: Mon, 14 Oct 2019 19:04:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
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

Hi all,

it's still basically a PoC, not yet specified and with a lot of sharp
edges, but it works too well for not being pointed out:

The queues/jailhouse-ivshmem2 branch on [1] contains a virtio-ivshmem
transport driver [2] for Linux front-end guests and a simple virtio
console backend device model [3], also for Linux. Combining that with
the wip/ivshmem2 branch of Jailhouse, you can call in the root cell

# echo "4a48 4a48 4a48 4a48 ffc003 ffffff" \
   > /sys/bus/pci/drivers/uio_ivshm/new_id
# virtio-ivshmem-console /dev/uio0

and then start the Linux demo inmate which uses "console=hvc0". You will
both see the (late) boot logs and be able to log into the guest, like it
were a serial console. And all that without touching anything in
Jailhouse (beyond generic ivshmem 2.0 support)!

More to come, latest at [4].

Jan

[1] http://git.kiszka.org/linux.git/
[2]
http://git.kiszka.org/?p=linux.git;a=blob;f=drivers/virtio/virtio_ivshmem.c;hb=refs/heads/queues/jailhouse-ivshmem2
[3]
http://git.kiszka.org/?p=linux.git;a=blob;f=tools/virtio/virtio-ivshmem-console.c;hb=refs/heads/queues/jailhouse-ivshmem2
[4] https://sched.co/TmxI

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/85f868a4-bff5-567b-fbd1-22c79406ad17%40siemens.com.
