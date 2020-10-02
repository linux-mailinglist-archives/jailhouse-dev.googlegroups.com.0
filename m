Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBFXB3P5QKGQESHMORQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E09280FB4
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Oct 2020 11:19:19 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id b12sf373510edw.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Oct 2020 02:19:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601630359; cv=pass;
        d=google.com; s=arc-20160816;
        b=uILtyPB9YM4C/FPDznUr805rTIFERaM2aN9WVnxuouJ+OvUZC+JpICucm5yJFSjIB3
         T4z40+6VrmS+S2IG9LCVqpw77vy3uUgVu6Kq4n2aNG1KctwI0+eE6x0yYBtIMioX4rak
         zXT1FpMwYNVUuwyHCQu2Va/XZC86HDFRXnmhDPzrqOggJYGqDRSgqHh0V4aIEQkmGfsL
         rlVFn8LPw+alrzRDIL0W3dbjV+Y52BiimOiRqhfc4kJtGY8KJK3Yi9WwXDhcxmgQxIyE
         ePTBJOpjrhN/X7dLZCwPkRv4f7+G++rdh9YuEllThg19BIJbpSm2iAINlbmC1M8Bt5wI
         c+qQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=SMl/IDwDnbfH2nzdBVVpJv7IQnd8j7fPZPID4al4OjU=;
        b=FHo83laIMWqs0OFjq5iZeadux2tQwo4LE6GYPqjivFnb2D7vxGYLbHMxuBVzkTrRk9
         R/+mTu/X3UKEBLHAgwoQP/56K/7fn5mAlsioc9xdXBSZmLYo4Ff67CvkL5W5swEhAkmL
         rYL94u4jlS4DNqsmUqqRKD/fjrZokzZGv43KqB+szD1q/0BkXJ/B7UIhfs/QY+h6s8Bf
         oSPJOO4djui/79dnGg9v5h/sua1ErKKt8BqPs16ahT7I4Q46xTuOwUnpH/3LcBeQkCcG
         fFkBV8EQr/YZu3bTwrYwe5qv0EN0E6XH7hIpCUTFkqt9oUn4hoz4Kn+tc/qJReEjTW+P
         JN/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fRFGOYPs;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SMl/IDwDnbfH2nzdBVVpJv7IQnd8j7fPZPID4al4OjU=;
        b=IpflVUnJgxMfLpaha7Ax0sW9Ly7HLd9/a+veXMFUOC2X9YfGqilc4laQtJoBammkju
         1h6CmgMa3VKJcNlR1GFwNQ5ru+5csENx89glxS+sf5QDHg5WPTiIu1zJB3Q+KAFEIiVu
         f2uUtBrw4zU1gtpYBztPD/7FqzBTFLLGNyK7iFWglt86oIIP2NW6IcMVhZWuATTNa3wd
         iIuDYA8OeUKA5UKfL3e3jNja/YeR3LB6l+Xa6qY59/AwfqiM7rgTs8Qs2jKjJ6i95vCJ
         RqgZ6F/qMwOqa4tQIspuhzGR4jRHaZPBbWIPsXDgEs4ASqfmC76fRxYzVIljv/iZqPuR
         oPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SMl/IDwDnbfH2nzdBVVpJv7IQnd8j7fPZPID4al4OjU=;
        b=h4i+orxehHaD1jVrtJClzrluWUch0QgQ4wgodBYs2gaFcP8/MhV46Y/n3wEFQ/m+k2
         D//urJqT+PGBwbiLo1b9tv4LHHkR32PG+ayPoVGncj1/GKAfHT1EIixNz28GtDuJc/yG
         JBBRowLeHBUA5uA0PWTGSWq4deExobOUAB9R8q2kDUGhH76b8Qsg3j9FeuEcA8QvJ3YH
         sLlV9YXDGGw8ncfAMQ8XX0JuLd0kWseMHyGMaQR7wxRVA+X7XLYX4AqcX5NPwGmpvbUz
         BzfF3KRJv0HTIjAIyTTuwoIP12RALPoDsZf5FdR/DhWErJhOFcRoJG3Yua/5A4btoFGn
         VEVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531viZw+C9W6nrExxE+XLJ688awbTQ/fUEdy+jidrou0wGJULP9N
	3K23ZOCx8JrUr8T5cPQGnkU=
X-Google-Smtp-Source: ABdhPJz04FEWKNM1oU9YjgNKOv3NqTqiEjKPWIRd/W0SSBdDYv1XSj945KqvkyeeOBAu2RbeiZ3qPg==
X-Received: by 2002:a17:906:5008:: with SMTP id s8mr1356081ejj.408.1601630358892;
        Fri, 02 Oct 2020 02:19:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c545:: with SMTP id s5ls1153669edr.3.gmail; Fri, 02 Oct
 2020 02:19:17 -0700 (PDT)
X-Received: by 2002:a50:9f66:: with SMTP id b93mr1109504edf.201.1601630357754;
        Fri, 02 Oct 2020 02:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601630357; cv=none;
        d=google.com; s=arc-20160816;
        b=T0/oAyHX5y/yaj3DUplE+6eEoN/VBu9YIIylXjVVCpkWEi0001IRdwNW5ahfa0bYL+
         ihPGhfbmd+g5rh1eB9hMfXWYN2UyvMfByr5D5opSMKZXbW5Or78pNxAoFFIoW7QF9aHC
         7lJZCPtL+BvpxZoDZuvkQTLw7N9K3gTu8bzdXggSrnw+owL+1MakDwoaOQj/jpRwL1Ql
         eNzAsawwafvmgZB1hIdq6am1IFEJ8eHFMfzAHFJuKi5Gaku3pUcMGAHYJ6rwz1iN6cRs
         E6OzYwgoD7QqoAhtWInLdj8k6HppPQtTNEzpgbRxWreZyXlLj3k769O3vjL83ZUoUZsX
         6mUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from:dkim-signature;
        bh=9KD77lUfBnYmzqJSRmfAuipyFwX4Am9jSmQEJy0PcvA=;
        b=OYGRU1btXY7apq5NacXUMKNDkeo0CZUNlYPiUsQyvEuyLl1861053cXqvWCEym5KGm
         bp/Lt3F1gVT931IA4bLo6u+fuXiG/Lt5MSQbPWJKEU9eWHYbygi+3WAtYAykA94oyc41
         zrJkdK97F2zJG1lZvkPvVcDznf8/In22+dOctqbzxBsoKGoepskKBhYzneTYdJMTmc2s
         qRrtbrSxfS4s4RNVTS/fPJ6guGxjj4Zq0Jxp5iCcqe37brkij4LP2MsaGUNJb5H0Yf30
         SuJ26TaJIqWUHNgobdugfX/uMb8rT0laGKBMLyWyh8hY64o7J6h/sohzYZYNAZ0SQ00c
         VTjQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fRFGOYPs;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id dk15si32050edb.2.2020.10.02.02.19.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 02:19:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MpCmZ-1kkvWt2XcN-00qZsu; Fri, 02
 Oct 2020 11:19:16 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] kbuild: Set -Werror in all KBUILD_CFLAGS
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Jan-Marc Stranz <stranzjanmarc@gmail.com>
Message-ID: <d046f951-101f-5bfe-d055-abd2a40c9209@web.de>
Date: Fri, 2 Oct 2020 11:19:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:n5pu7hTbTftDCVIvYqMyiDXA2Cdn2GX4FIjivJJEVuqSsRKB0j6
 vrt/VfL/V5a/T32oEBrt7SwL3vJ10sbqILPfFV2dlBH5ZMz/sdihWHJv6LRQwRS6MLN/aSi
 Zdm+LwbGxhaPQA6N5fOvqO/Nsvjkafbn7kyeFrALJyXpQ2y9Xs8+G1z49O7tnY9b6iJ8OAd
 gh7Fmr5PLaT/QY0DSVl7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lIfhfuZWBxc=:m8/SJ8pHdFdefEcKvqTZGC
 g4MFahswPFort/ifKpqBdfjjX0tnsGRvli/2oVvmefDEx8SL7/jg/ILzieXKcb7G1TKiN4reU
 KSzdRKLJjHNBsMIow6UdvRFO5Ll9Cr4BX9YNlY0J2GSUrsIjTH+7bwX8VBCMIyjonC1pl6TCc
 6EExumslWOoDaDoL5PgOliY7wji9ca/V5BNErp1yDPrjCGbW898p+EBGGRhTdUSlV63CFxiy9
 9ST/w1Iqjgp3JcyQKNEFtJFPm+WrEAGWAeflrzo4GwzIYovvVaZwVYDJ6DwPnz9xSoJktG1r+
 FFSpGRzatgk4NqpcSV1Hv17kmMqWokpnPjEpgtUjZFjVVfwSrRDDyd7aQpOonXQeDG21gxkQo
 aFyyeKBE/2+JA4w6hZ0mvR3c9WUJl6mVyQdDZI0E4XsQD5CrMaRq/RtCAEM0HAFsVzdzkTDi+
 69G1nYl11bJEP6Cf6VHAGVN/DiTT8uUu1wox6cRg5des8gHQIFIjRhBBfwxkCCkQ18//gxkze
 MIfLVhBM88M+a/ipnMMHVqNlnhSj21wXAJK5BYF3wecNs0e8uu/oplYqGJbYgYOx9lGfOxAsT
 d7X/iie8saJdQTle6XSOqiErL14bO8cZYJc0yrTCErL1uCA4+ULTqTr2B7raftpraBJWqPRzU
 qMSRa0WJF+xsrIAUMNzN2ykBe0+zR7Qqag87dIwjwVNPs1dtzjiWHOLSY3psIvqH0iVnnp6Oq
 x5m6Qieot/nWEdMuqmqc5nUvdnnvB50nXx9dvvE96J69nMErmt9k0E9TTloGeiYaQaxXmHOUa
 5+6VvD+z0Y0atm9aLhJ7oHaUllPNfsolQN3mrzr57fkUUO5UOnhyhs4cu4e48oTYzwXNS79pc
 yKgQBuH5wMfhRrDSnVTC/K6ZYD8iMh69rtnpx8OdwCgcpOyDfMWLK0PLGboUXq763X82Kf1EN
 ZlgzwSYi0rzBYSK4rdA9yMW1eg/GRRv3Yl5ZuJggP7RQp3vtdQHXLUdQ+KQGNMclFtsqRoSMQ
 nMqO2vFkRjuvtIa73IrgWPLh5bVB4LqSUVNwguWzU+y9xH7jFDxWiMQCYHaEDhvpi8ZfT6Evb
 sPuucABPNqd5QKc06hPcuBxpWGSiWHzDtyfeIF3LrDKPylhiHocjVGxneRBh0RmM4bUFalXJ7
 jk9WwXRNKFuXqy/J8fWw+azElsoo8UcjEVZFtUnfSB70kN+YZl6Bazt1AWubikZMu5+tOvZMY
 lQXAqZ6xOQrlBYu9skbz9DB+DVvi8fqYLlnYz5w==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=fRFGOYPs;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

subdir-ccflags-y doesn't have the desired effect, at least with recent
kernels.

Reported-by: Jan-Marc Stranz <stranzjanmarc@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Kbuild              | 2 --
 configs/Makefile    | 2 +-
 hypervisor/Makefile | 2 +-
 inmates/Makefile    | 2 +-
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/Kbuild b/Kbuild
index 1808dc77..b76a8dd7 100644
--- a/Kbuild
+++ b/Kbuild
@@ -56,8 +56,6 @@ $(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh

 subdir-y := hypervisor configs inmates tools

-subdir-ccflags-y := -Werror
-
 obj-m := driver/

 # Do not generate files by creating dependencies if we are cleaning up
diff --git a/configs/Makefile b/configs/Makefile
index 31ca15a3..513b0a9b 100644
--- a/configs/Makefile
+++ b/configs/Makefile
@@ -17,7 +17,7 @@ include $(ALWAYS_COMPAT_MK)
 LINUXINCLUDE := -I$(src)/../hypervisor/arch/$(SRCARCH)/include \
 		-I$(src)/../hypervisor/include \
 		-I$(src)/../include
-KBUILD_CFLAGS := -Wextra -D__LINUX_COMPILER_TYPES_H
+KBUILD_CFLAGS := -Werror -Wextra -D__LINUX_COMPILER_TYPES_H

 ifneq ($(wildcard $(obj)/../include/jailhouse/config.h),)
 KBUILD_CFLAGS += -include $(obj)/../include/jailhouse/config.h
diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index b8377a33..5322b5aa 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -26,7 +26,7 @@ LINUXINCLUDE := -I$(src)/arch/$(SRCARCH)/include \
 		-I$(src)/../include/arch/$(SRCARCH) \
 		-I$(src)/../include
 KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
-KBUILD_CFLAGS := -g -Os -Wall -Wstrict-prototypes -Wtype-limits \
+KBUILD_CFLAGS := -g -Os -Werror -Wall -Wstrict-prototypes -Wtype-limits \
 		 -Wmissing-declarations -Wmissing-prototypes \
 		 -fno-strict-aliasing -fno-pic -fno-common \
 		 -fno-stack-protector -fno-builtin-ffsl \
diff --git a/inmates/Makefile b/inmates/Makefile
index 81099b84..7d3fafa0 100644
--- a/inmates/Makefile
+++ b/inmates/Makefile
@@ -22,7 +22,7 @@ INCLUDES := -I$(INMATES_LIB) \

 LINUXINCLUDE  := $(INCLUDES)
 KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
-KBUILD_CFLAGS := -g -Os -Wall -Wstrict-prototypes -Wtype-limits \
+KBUILD_CFLAGS := -g -Os -Werror -Wall -Wstrict-prototypes -Wtype-limits \
 		 -Wmissing-declarations -Wmissing-prototypes \
 		 -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
 		 -fno-common -fno-stack-protector -ffreestanding \
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d046f951-101f-5bfe-d055-abd2a40c9209%40web.de.
