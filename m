Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4HH5TUQKGQEX6XASEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DFF76F8C
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 19:10:09 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id v4sf11855867ljk.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 10:10:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564161008; cv=pass;
        d=google.com; s=arc-20160816;
        b=qeslaDPBQsHfaTeV9HwZvi1ZOix513//cCDGOTQKW5LFfii3bdkkB2Ef5O0q0+GCvP
         fH/GtqcTeS/FcCWtjhk6RzFdKiccHbvp0NaZ+XjxJV6XclmDWfhIqYuyDlPgOLFrJ2GR
         Vus9lr/aeXzxjHyqPdnP6ASxt1qSNGgb7ksmvpF1YniKC5ikBXm/jh9gicfIy7EhpWkx
         56rSBmvYIow8rAT76wXKuhpEzAe89iUnSG54vWD69GvLx68FjYrpINXq1xX2Fyx0hOPf
         zchyr1tVxh4owVXMZfsOxjKOFX6sjYFAwl8eGEKlGdvO2TDJSWCG1EZNQT7Sds9bo+sY
         AYxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=xbJYK1HBYIOSsg+0RdprqU6BgZ8wizdWSHC4X+NjIJ8=;
        b=Vs0An47XRotZwxymUaIQSgN7o0iHCMU5tGiw+xd+leTdnl14AMzBkQNfEsbipIkkI/
         YozCzenY3mYEj+8gnZ2ae9jlt8+39FcVahSx0GTyKHgvWCa7bMhy+AChjrmE5I8R4vLW
         Yep4dd1CJJtaVPeWVzbwcMrW4qkUJnRmqANYa2Md8iARsM/SigV5U2JgtcCgLJ92SQk3
         5wrHamDCMWcmeyvuO47FzpxZpLa+za9Li9HuWpE3GT0A4EOTE6EshUwuPP1wh7vtrUXS
         l93vuVvD0eQFhdCTjfwcuefz6VOlBvMxOGyGQQEt3D15aZBqO+PbJrhCadxNOikTB+Uj
         SceQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xbJYK1HBYIOSsg+0RdprqU6BgZ8wizdWSHC4X+NjIJ8=;
        b=k0yf2KVFmxiqZs0+hq9AL11YN12+TUN8QiJrNs12lhD1HjQWKHqPaY3dsB6vC3D3/b
         X6PWtncgbrYkXuNhLbdaxJBXU+Hx2mjwAjwsxaOWsj4Kqx+cFnBDdnyrLbt28xLIH9O8
         5YOPiAqjCpH2DXzIWju5egS+2Y1hNobBF9GoKFHAKO2BUsjbCnLGPUNGJ3kY/l+dUL/T
         rru7oDOzQmxaNqdOIsKurInbcEhiOzPH0tBCuiQTnRshvkHwvKiuKLhPphqnBt2LXB3/
         g1bX/jwZCgzOAoMipCjbGWtOlEI27sbE+7lv5OwLvZk0BRpjmWAOPAYIssojnws0bzyf
         OY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xbJYK1HBYIOSsg+0RdprqU6BgZ8wizdWSHC4X+NjIJ8=;
        b=DoZD98B0v1JuQl75Y/SGX80jkZRW2chAwop6fVVeOmHY8vbF3jUB3iIcWsI3bPyzzt
         rOq+EyNCSPoWP4QAHVfYe3TPDNOQfxRJycQ863RI2QOZFVbccZOhIKv/hdBjDIODyblF
         AtIWkcYI7NIgqkUvrNf+wmeg8B34kixEJExNEJyu4SBegZtLdkxFIgiAD+ditpZmt4Sd
         4onCH5IpXaWU5CBXEEdr/34ZkjSZD4Sl6qkuanCXdehijOy6lEIYWyat01Dbe8wkz8fy
         iovVCnCE/Kwb0sA59wfA9WvPmLSgK9WQpeNuOPQHdCyJbHMZNyL4abmDqexHAidOiWo2
         ibsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWc8UWd2vBpdIcjxsL7pwSZNCwaXQwD/wK0WqU9IrLcZtN0Ppe6
	WZu1p+RkPL5U0HK5TLg40fk=
X-Google-Smtp-Source: APXvYqyDZSq6eWKT6EcnB8WJhcpcZ2c2KKQf/onVrmuVVvE6bcQ9jBF1UxlT096vQeGQqUp5FvH0ZQ==
X-Received: by 2002:ac2:4839:: with SMTP id 25mr44973979lft.79.1564161008648;
        Fri, 26 Jul 2019 10:10:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:f715:: with SMTP id z21ls4488248lfe.9.gmail; Fri, 26 Jul
 2019 10:10:07 -0700 (PDT)
X-Received: by 2002:a19:f711:: with SMTP id z17mr44907782lfe.4.1564161007811;
        Fri, 26 Jul 2019 10:10:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564161007; cv=none;
        d=google.com; s=arc-20160816;
        b=yGHgO5wc3IxZwlHU52+A/vPqpx4ql9fwwUnvRaJi8WhXQooiqIAWcYNH97Ef5Pnccd
         lAnQ3jjBzn6Xl6MKG95zkgV5UpU9stijDB8mHgprUgWjFordZAQ6ixuJ6FZhc+odIym+
         +4WnxAeN4f6krHNSLWZbSyAqDuxoUNC2tEXzHkt95XxQfl2CpRvKxKsbdieC4qm9DDAq
         3WiJoId5S13IeulIrNwMS25CJeTwSDOXlbSo10SMzkL3PMwOa2yteheQS/KCtco4AJZx
         8RqdB04gQVcoMfh3ZU60L6PNBjhXou1a0K7gLCAgReJEIJ6ZSkeEKU1MycqnDO0Zbmwo
         Ob2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=i0az1Vd2dJ9I359qoQZ8rgyOLgtsQxm72tfwAD8yx+4=;
        b=Qdc0vJsKRCBB3omD7/WzITw10twTKt7F5EKbYZ1h5lkdyiIraVZPPhkafM7EPNQkc2
         zNN6OThoPMpFxhNTb2HI/hOYWA++UDuiAPwS35SJSbOeIk/mUnuB3S6ChkpG5gIsLxH6
         aIL0W0CdodkOxuMDL+YOoWmbTqzfFAKv81HEQK4IMi+CLcnpu/dRW/HwpwQpeRpfnDSF
         CJZoKljrd8Qst9n69NHk9hWejnhFx4BvXbBkSBLsBvjxqSsKJs+te/QK4bHRo57g9soC
         b+8MLs8JJnKS+6OR9rDcXug1jG4dT1TcpXMYU8Mp/9LACXIyGGj17AnquqpKftQU2vZq
         uC1A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id h11si2821169lja.0.2019.07.26.10.10.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 10:10:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x6QHA7nX000397
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jul 2019 19:10:07 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6QHA7o8032260;
	Fri, 26 Jul 2019 19:10:07 +0200
Subject: Re: [PATCH v3 0/5] x86: convert pio_bitmap to pio_whitelist
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <08bf7922-89af-3832-4516-651257d4cbff@siemens.com>
Date: Fri, 26 Jul 2019 19:10:06 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 26.07.19 15:59, Ralf Ramsauer wrote:
> Hi,
> 
> this is a follow up of a recent discussion: Let's convert the pio_bitmap
> to a pio_whitelist.
> 
> It supports readability (no more bit fiddling), writeability (no more
> bit fiddling), reduces the size of cell configs (per-config reduction of
> almost 8kiB), and generally, it's more Jailhouse-like than the
> blacklist-like former pio_bitmap.
> 
> This series first cleans up and consolidates a few spots, and then
> switches to the whitelist. Logically the series is pretty straight
> forward, still, there's one little trade-off: vcpu_cell_exit. We have
> some more complexity there.
> 
> But hey, look at the diffstat!
> 
>   Ralf
> 
> since v2:
>   - Remove .pio_bitmap from ARM64 configs
>   - s/pio_bitmap_size/num_pio_regions/ in jailhouse-cell-linux
> 
> since v1:
>   - rebase on upstream next, respect integrated changes
>   - refactor jailhouse_pio_whitelist to jailhouse_pio
>   - more consolidation!
> 
> Ralf Ramsauer (5):
>   configs: arm64: don't set .pio_bitmap_size
>   x86: drop vcpu_vendor_get_cell_io_bitmap and struct vcpu_io_bitmap
>   cell-config: introduce pio_whitelist structure and helpers
>   x86: pio: use a whitelist instead of a permission bitmap
>   tools: update config generator
> 
>  configs/arm64/amd-seattle-gic-demo.c        |   1 -
>  configs/arm64/amd-seattle-uart-demo.c       |   1 -
>  configs/arm64/espressobin-gic-demo.c        |   1 -
>  configs/arm64/foundation-v8-gic-demo.c      |   1 -
>  configs/arm64/foundation-v8-linux-demo.c    |   1 -
>  configs/arm64/foundation-v8-uart-demo.c     |   1 -
>  configs/arm64/hikey-gic-demo.c              |   1 -
>  configs/arm64/imx8mq-gic-demo.c             |   1 -
>  configs/arm64/k3-am654-gic-demo.c           |   1 -
>  configs/arm64/k3-am654-uart-demo.c          |   1 -
>  configs/arm64/macchiatobin-gic-demo.c       |   1 -
>  configs/arm64/miriac-sbc-ls1046a-gic-demo.c |   1 -
>  configs/arm64/qemu-arm64-gic-demo.c         |   1 -
>  configs/arm64/ultra96-gic-demo.c            |   1 -
>  configs/arm64/zynqmp-zcu102-gic-demo.c      |   1 -
>  configs/x86/apic-demo.c                     |  16 ++--
>  configs/x86/e1000-demo.c                    |  19 ++--
>  configs/x86/f2a88xm-hd3.c                   |  27 +++---
>  configs/x86/imb-a180.c                      |  27 +++---
>  configs/x86/ioapic-demo.c                   |  22 ++---
>  configs/x86/ivshmem-demo.c                  |  13 +--
>  configs/x86/linux-x86-demo.c                |  16 ++--
>  configs/x86/pci-demo.c                      |  16 ++--
>  configs/x86/qemu-x86.c                      |  41 +++-----
>  configs/x86/smp-demo.c                      |  16 ++--
>  configs/x86/tiny-demo.c                     |  16 ++--
>  hypervisor/arch/x86/include/asm/vcpu.h      |   7 --
>  hypervisor/arch/x86/svm.c                   |   7 --
>  hypervisor/arch/x86/vcpu.c                  | 100 +++++++++++---------
>  hypervisor/arch/x86/vmx.c                   |   7 --
>  include/jailhouse/cell-config.h             |  28 ++++--
>  tools/jailhouse-cell-linux                  |   4 +-
>  tools/jailhouse-hardware-check              |   2 +-
>  tools/root-cell-config.c.tmpl               |  22 ++---
>  34 files changed, 175 insertions(+), 246 deletions(-)
> 

Thanks, merged to next with minor adjustments as commented on the patches.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/08bf7922-89af-3832-4516-651257d4cbff%40siemens.com.
