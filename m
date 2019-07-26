Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOWO5LUQKGQEO6CTMGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C8075F7E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 09:09:47 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id r9sf12089160wme.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 00:09:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564124987; cv=pass;
        d=google.com; s=arc-20160816;
        b=SuPnj7hY+riywDvR4kyDcyG8Dv3RLGcE5R4NwzIkH1GT54s+Quq/CSNEs93jfEsU8k
         RmcLyZ0wTIlHCWlauhGVyD927vVdGv9eWNHja74Uo6KMnHgWj7YByUw8BUE4B3+LLVgH
         qZR6sXyXtmmiXIX72hf3PbduRWDt69IWhD0cp3Mu5Dr5mb49Krs4ZrKEUhYDORkjiu/o
         IU/n4ECUMoMiN1VyPXOr+4cR5WHY16ao+pYnmnCzLCKt6TbUGyLa+Ujx5Va3mBHpbNOR
         BhO4eoPMGwrF6QVQnIADUtyupP903BDegjel9A67JM8fxpnnrnhNiWjGXLXURUeGu+fg
         yxlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=JylAwLN70dlOJishgYcbuxy72oHzr+mpJN3Lvox8wKg=;
        b=SSRIEtsCBahRu1opMrIkGU8IOioe6Fpkg5F79n0sFiMsDT9ddPBRjTpLVxyhVrdM71
         1jPL/YG7p039QGvBHy/PmUEfUTCRFSML4pc6tjihR4ytZXS200deRkyXKlFSlJxy27jb
         uQ8k0zbey9TwzXdbwnUfrpYncP/wBnpXG4WEWX3B4v7Nw/CO/YP94DGXyxbuFI6pfNYg
         j8wh7PSYuVKht1vJ6ZCYeqN2iaJboYUw7143m6QTfVdpMstcvDpWodb06A7t8rINKqJj
         h8tyut8ekk8PnrB3IEUWdVFAFEk+rOzikMq3M2T45Zkm8/8+d8S2MLdeV/T+MTJ8L4Fl
         TFig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JylAwLN70dlOJishgYcbuxy72oHzr+mpJN3Lvox8wKg=;
        b=i2vgtPrhVHkx9DxoU0ksmSOHKlsbSEVW1EvrmEdxYLZsNtxbXmjP8BSE/un1lx2CKX
         LPn/Ksd+CFM7rdbb1XcO67RcJpT5kjbKzZg9svOWAbRaQNO/cDnhszYFHVLsXB/kxtkM
         McIK1GZUhiiL/QgVymYh/+k/NnM769E9Gg/wFCKma5lKcr6KOtm4Hgvf197m0GT6jcZW
         mOjPm1MKq1I5bLC8cXkVfBlJdM3QyW1jWdb6exc6rioiyYH+29Ws3Qq0CA0oSS9Immu+
         qHwGyMqN9JrNhfJfs168h68d60tFEp6vu8mByRaGnjngrj7j4jsZOTX1YD6FzB8NMgy+
         aQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JylAwLN70dlOJishgYcbuxy72oHzr+mpJN3Lvox8wKg=;
        b=gr/2nT8HJ76GA0oYNty7CgekGeTAMcslnBgT2eZjts0dlR7tcDh3hV2cEYWBeO3A+V
         lX/KroV86TKYyOsSAY10bk2WHIQTtQYBBEdRYBKNtjstkKI2VRjjMHd0z+qcb8FuNRzk
         IClxAzu0ebUKtBZIkawyBlVdMLsGmM8xMMn1H8FiTFabrm76p2miuhQMTqBfvYZOW5Lz
         DE801KJhy35CEgFb93XZja2leDTrb9qSaqlLlJ5BzrcK2xDtBoriR1yTIYSgYH85JrIe
         lhCDMI3kIhM+LAUrJ1pJdXQw007OQQZ6b3xDHbt4XCtwTjkD4eLp8UuU/Wal5hF8OQfw
         HpHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXmVTE5GR5uj+tCuGvg7nqSrtAaJ+LRBHLWzcb8/26oqoozqVaM
	0/lfFNa615Nm5fNQucMQDQc=
X-Google-Smtp-Source: APXvYqwEvuEG86ZNyr6SVvOc/z+lzvVqGupS47gMYbKzIT+lpcGA5Sc1Xl6aRF61+96ksGpKUM7/bg==
X-Received: by 2002:a5d:4108:: with SMTP id l8mr97631542wrp.113.1564124987156;
        Fri, 26 Jul 2019 00:09:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db44:: with SMTP id f4ls15565669wrj.15.gmail; Fri, 26
 Jul 2019 00:09:46 -0700 (PDT)
X-Received: by 2002:a05:6000:12c8:: with SMTP id l8mr5489111wrx.72.1564124986272;
        Fri, 26 Jul 2019 00:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564124986; cv=none;
        d=google.com; s=arc-20160816;
        b=VJyr8BHNu7vfEhSJzeHWKk3EFzraqvvDFlm/b2o/Q3cUOZy/kNP8t8ZuDoWE0qS/6Q
         hM1a0hfsg+Qdi9b6HH8VTMm2l4yX41iE+lj4OnQvorJTNl7ZvwjGgQqziyO7nX7sKJma
         35bqzYQ7YbJrJqShGe7jhPy13qU8PEffhjikcKSpMClTYdwEsvyijokHG3LWv/J827aE
         GLFYFwGPDSjkW3KLUUdLF6CkUZIcZL5O1IQh9svIRY1I8zs0zV59/7udkHdjQhUuAHb4
         w+i2HLpRXVUV6BXkptKeQTto7VkZOlSEPBPeFocZyXsHNyb2gHtdk3/RiOwiK8vgmuKm
         eRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=IluuRCEw2bNv9UMX/3nNj9uqf7r66R5Fm6s8S2P9wM8=;
        b=LRN7XWpE2UrUceMh1NcP8dWwyxmGDYpHmsJcl5IHcrhdMTkbOoIa7UM6YktzinrnTZ
         vgQyuWIwIxAPjj4YJ0DCNdJQkDvvQvRrFPGx5AdzUCCyK64Hx8QOFqK9N6MFDCvsKuAM
         M7jZQVFyDeFora6XzvKkvv+uj2u++eLA0dh5Ja9MQVz5g45OwkkVo0Fs2rCqYJ55dHj8
         WzJahArj0Y7pY1/WduvU6YuNKBJDvcPvoNXEMOJSWmKPHpeu0BM+NytW+wrBtEzEbSY9
         r1XxsiDaU1D807ajcoOahnlF7rqNbCxBnepuGkryVm9tDlai840Erb+cP8qf3eQp4yVR
         hSgg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s13si3081585wra.1.2019.07.26.00.09.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 00:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6Q79kPf004841
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 26 Jul 2019 09:09:46 +0200
Received: from [167.87.23.89] ([167.87.23.89])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6Q79i2r022620
	for <jailhouse-dev@googlegroups.com>; Fri, 26 Jul 2019 09:09:45 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] kbuild: Correctly step into driver directory
Message-ID: <d6841667-0a83-a2ce-d34a-2bd7cef9f8a2@siemens.com>
Date: Fri, 26 Jul 2019 09:09:44 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Descending into subdirectories with modules via subdir-y worked up to
5.3-rc1 but was never designed to do so, see
https://patchwork.kernel.org/patch/11059033. We are supposed to use
obj-m here as well.

Don't migrate the other subdirs because that causes warnings such as

cat: /data/jailhouse/hypervisor/modules.order: No such file or directory

due to missing module targets there.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Kbuild | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Kbuild b/Kbuild
index 7cbde529..0b25e26e 100644
--- a/Kbuild
+++ b/Kbuild
@@ -51,14 +51,16 @@ GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
 $(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
 	$(call if_changed,gen_pci_defs)
 
-subdir-y := driver hypervisor configs inmates tools
+subdir-y := hypervisor configs inmates tools
 
 subdir-ccflags-y := -Werror
 
+obj-m := driver/
+
 # Do not generate files by creating dependencies if we are cleaning up
 ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
 
-$(addprefix $(obj)/,$(subdir-y)): $(GEN_CONFIG_MK)
+$(obj)/driver $(addprefix $(obj)/,$(subdir-y)): $(GEN_CONFIG_MK)
 
 $(obj)/driver $(obj)/hypervisor: $(GEN_VERSION_H)
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d6841667-0a83-a2ce-d34a-2bd7cef9f8a2%40siemens.com.
