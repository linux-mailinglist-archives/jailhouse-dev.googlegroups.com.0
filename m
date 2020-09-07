Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU4S3D5AKGQELREPJWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CC925F7C6
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:20:04 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id s11sf3746209ljh.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:20:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599474004; cv=pass;
        d=google.com; s=arc-20160816;
        b=DxX95Nb1VsvDWIvBj3ME2/e8B3c8AEUTJrlaxLX2jmthxEMTyXMYnzOXHkBsCPHREZ
         sYEgNS7sIWu2GbGupyA91nhQPNexzV2+PHJ+rNDWHk0Qoh2EgZb6j2nk6f99eRJm87SF
         UYAwb0gWUAmsV5+09Ten/2GF+oYb2Y81TeZjujZSYW4s8hlspL6CLbwdsto+pKMIwGMD
         Uid7UOSeTA88c7NyVgoAtO7cBhTRrCH+15CtvaJ7g4Hjg1I8dK0yi+DFXIdDUnELILtB
         xL16RGmjOEUpjOgGN348eNp1TfWi/We1Mey4qKcnh2Oq1K0Xvl8frCoDA7/MLEODpO+V
         XVsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=bO0cQzzDois4mLE159cqa7dhnhdaWhng3Y+xMegG9xA=;
        b=H/Y9Jl9/FHxuyKpw5ubT/QchEMYcKQpnWa2mLtysbvncCduLAqRQRSE9fZUcWbZKGy
         DgvXlFPHtioy0oQx53zeU5KM2vL70SWKDAYAqabE3ihJMgSTx1AQ1GFWhDwE/blJvrCw
         a/wQxZMIuVf+NLMLP5C95niauPK/gshYMbGdV9AoK0oYwxbwXwa+1f9QsdtiI3x9X5AK
         PhwWTaAcDLOU77BZ2YTbZX+kQQgiKvcyp4NF+8AJbEChM2ad7kah7rh0yuvKyOgOgDHd
         9vSJ28JkMWoNMlSU79KB8xBSmQmOpnq02pjjjZnHpTHKW9XFigJKM8rAYX4eR5f9WErW
         vJYw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bO0cQzzDois4mLE159cqa7dhnhdaWhng3Y+xMegG9xA=;
        b=qKJmkgC32UXhMlyeynSeYnDuCS0aXYyB+u5/HCHXuQzHOQF7t209wahm3UmYC5nU4D
         JxvkFVkc+h7hVzV5JVHOn5Np6UTCSIzFw0YUjlMzgv5vmbXmXMUZOkOlN9R0YhCzj0Ec
         h26c+5h0Ov/eps/PyUYS2QvqBTK/NS/9JqCoVFw+IkaYb+PU4V92yg9ehEIyNhvMIDRl
         nn9ESkQHfpRBnptbYKgSne+C6M97x2vIofdMJT4ZYsHIBM9IRGQPTjr3fH5wMD/eR42W
         jkLoKsyS5dmB9yCKgwDx50s4HQ8pAMJyXlavQTyO2YVeDQch+ewNBf8O4BU+vOAcWMrB
         ZMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bO0cQzzDois4mLE159cqa7dhnhdaWhng3Y+xMegG9xA=;
        b=YegxZs1xhdfcIbDH+0pm+vPoRphD5gL/0ovT4DhpFPpVQmmN246ImttGTCHWrKsQk5
         xMEmOn2Rrpbiv4p/X3YmIWRf3XhVrb9NpCMp6RarNt9Pp58Cv8YIal0idDV09/0Hd7Re
         FLO9VAVbHf5/d/SsIwrUo2K0XYTT2X8AT/fMV0vFU4xDOkiiv4sh4qiqamvR6dTsAtOm
         g/6+knEytFzoqU4hfl5YiRs8mP+zYTAmOXtvMQ2HqCMEtDc0utWiCkdztrc+Vz+qyIhB
         I4aWt0zlg9YJoie8aIgTLW57oD51EXaXXVFrkvF36IQp60nCIsKcNaIMprD0hmfVrfQq
         V0HA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531dqP52NF5hD/4TBC+nMrTG6UQF5nLhk7JFU7cdgxrzgmmWW3Nq
	lriL29UP2jSKQnXrt/yNXO0=
X-Google-Smtp-Source: ABdhPJzYgkwNWLy7Gorkl+x3tFqEnqZb2RnhuNaZyMQt5i+j06lcsiBTS1T5HQWGstQJg8uxLuC1wA==
X-Received: by 2002:a2e:9590:: with SMTP id w16mr1087341ljh.68.1599474003898;
        Mon, 07 Sep 2020 03:20:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6e4d:: with SMTP id q13ls1641393lfk.1.gmail; Mon, 07 Sep
 2020 03:20:03 -0700 (PDT)
X-Received: by 2002:a19:7605:: with SMTP id c5mr9815702lff.116.1599474003034;
        Mon, 07 Sep 2020 03:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599474003; cv=none;
        d=google.com; s=arc-20160816;
        b=nregkXBC/jaIcyBAGIeg/eyfnBRp/kmPlaVREyTbJKgGVCQcB30dTGMIGmqqnH+HvD
         f9bpmLHKRH7lJjSRGnZKLEwodRwuZzfMdptoypOZPkKAJ3+dPbyoF5ht5KG5oHFv1Olx
         0bhpAI3+632Ul+dzmquMawJbhRpcRFmafy88gpGzGej3QqY/nGhMZBZ4IMSToSHTNT6H
         4mju0rdZHGm9Zy8fhDcPGv3IYNSCK3+nodQfokZvt3VYyJ/enf70XFcjRgjfJ9qmHGio
         096oONTdIZKzo0yRtn5idnC+fTikt6e5TqtPHw+jmqsUiRQ+AOoqDr8wfogmvyU7mMNW
         cC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=STKlfSUUB3e/LHzsjJjccBuBnm4SXKO5V4sgHotA5Vo=;
        b=ttObfbj/7Z+1yVGoJSoVQXj912UhlQgMIHzqURWWiVpeGQwMbMJkGGSuptCWDwsEyt
         TOhTbOkG6MyjAXrdJiiktDLN/7q4f3PGeJT6TAHuDxRHgPijPP555mrlpiKVcaD4HCUM
         zndk5py4VoWcQInchhPiYwmLoOmmLnfD7NQMDZeawnzoQ3fw68bPGJgt8T06JpVOc6Y8
         iH9kCIPDUA18/u2GLZ6/EtMbyuVIaC+12sw0Vfr7LudGBcoaubGRccynFWed3umCvcqN
         Ra82ROrokiqhOHHBHNRhABFrPCg2ch2uuCRTOZ+vVGqV8CCH+SlI0Sg1yeQQ9gYiS8Lw
         0LTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id r13si80140ljm.3.2020.09.07.03.20.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 087AK12w016687
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:02 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087AJx2I024503
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:01 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 7/8] pyjailhouse: sysfs_parser: Factor out MemRegion.is_ram
Date: Mon,  7 Sep 2020 12:19:58 +0200
Message-Id: <c54b26397441ea9e580aba317071f5f98050f194.1599473999.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599473999.git.jan.kiszka@siemens.com>
References: <cover.1599473999.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

From: Jan Kiszka <jan.kiszka@siemens.com>

To be reusing for merging RAM regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/sysfs_parser.py | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index b9e40f65..7067f779 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -935,18 +935,19 @@ class MemRegion(IORegion):
         # round up to full PAGE_SIZE
         return int((super(MemRegion, self).size() + 0xfff) / 0x1000) * 0x1000
 
-    def flagstr(self, p=''):
-        if (
-                self.typestr == 'System RAM' or
+    def is_ram(self):
+        return (self.typestr == 'System RAM' or
                 self.typestr == 'Kernel' or
                 self.typestr == 'RAM buffer' or
                 self.typestr == 'ACPI DMAR RMRR' or
-                self.typestr == 'ACPI IVRS'
-        ):
-            s = 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |\n'
-            s += p + '\t\tJAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA'
-            return s
-        return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'
+                self.typestr == 'ACPI IVRS')
+
+    def flagstr(self, p=''):
+        if self.is_ram():
+            return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |\n' + \
+                p + '\t\tJAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA'
+        else:
+            return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'
 
 
 class PortRegion(IORegion):
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c54b26397441ea9e580aba317071f5f98050f194.1599473999.git.jan.kiszka%40siemens.com.
