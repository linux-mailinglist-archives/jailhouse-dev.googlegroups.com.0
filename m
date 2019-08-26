Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBSVFR3VQKGQEJGBHVPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 603D99CB3E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 10:05:31 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id m7sf9297380wrw.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 01:05:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566806731; cv=pass;
        d=google.com; s=arc-20160816;
        b=ADUpuaRRlJtdfUOQldTLbaUx56TqD9upPGz5r9tlgmcr5C5zkCvVJMIGdz9YBOtBid
         Wy+URZQxEcwyk61775zCe9nXn8HeVivKVyj6SvPSr/pMaK5EpwTwpgpbO+TRm1fFNyfc
         9+L584u7QyGA2bLsIQyP/yii/NgcjsvgiIrgsFJz1nTbvamsWYmNwbjbeK/5wgu+ptHb
         5LJfsXhlVv7kx+NG46ciYhv/0eLMu+Fe1vuZDJucv93p8FDLJSFUmrbmUjkmyDhjcSI4
         vC2UNzjNRGodt5DvmMTmyWFzR3WMkdrRwGstwIuTs/j5ccO2Btb89YIJW/E/SHfnmRxg
         5XsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:date:message-id:subject
         :mime-version:from:sender:dkim-signature;
        bh=fH2kXmkuAerjz8WCeZEYDfdMDEjZZ64WQxCj+b674kA=;
        b=0FFa1sqle8NXzV84A1APBeWt5A+kiUtOs5T8e4Zru6ch/gPPAv5JCnM9A4lhhIHK5+
         91+lZQHIsaQtJBW3owHemu5nOcub44B4hlay+95oWj7TuQCpJoTv4Br9DiAUzNMycHoX
         6yEiVM4mTQzYQRZ19/U93pfBocasaWvfUdtohmvZhfb+u+GVAvY4fiFOKnCuv7EM2+YA
         /6XyzSwgEcq6mAYgY6qt5TdpPwrk636v8mEINSYRe1IJ3RkEGTQFkWTgEWqCJgNc7b0T
         aXwp/NlAxClFpTWOOfAmCbZ8pHN16TqTq0LFvij1eOEmg3YmJBWXU2x0H8kA2FXAjRZv
         VVhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=eyNJ4dhb;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:mime-version:subject:message-id:date:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fH2kXmkuAerjz8WCeZEYDfdMDEjZZ64WQxCj+b674kA=;
        b=TMP9VQIxOw3PbGR2Bw6B0PjKJK0sXHU9gLU54DwuiEUfqTH/4sJXhZ/3NrpshUm2qW
         H9LB31sBc7UG2PdjQZydOIAw1284CGR6GNvxaVqt7IcmxFIbnT1XMLge1yG/ZSRmsSmi
         EGImb+qM1qaCp78ZSzZQHP+4izqsS98utdAALzqtOj4YOH0iEt4IItrFZ0Bjewn2hCpH
         8GqYmUSm+bRhED4gqeixA+XQHhIx7h8ssyIqKa/iD0DDmSCXSsKmxjhY5rlWKiw5bV+h
         gPlNccfMBsnhBjYZdPohvY6SpxsrnJ8l6RGSwhtHO+CCmp8UD9vnSRfgegqVAh9EDBOe
         pKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:mime-version:subject:message-id:date
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fH2kXmkuAerjz8WCeZEYDfdMDEjZZ64WQxCj+b674kA=;
        b=G75P/nAm/b0KpQnKnJBBNNTrIs7Lii6GUCUCDxQd/zBKEUusUF+Bz4S3Jep4+W72G2
         07oq+dnDA+j6Fr5OTeuqSXgZvzJOqc/S0owWLNkvupsICGrYPKcu75uFBD35uVmpOMBv
         BANbdIAjoELK79KUEdipB09lsBWIcAI9yJfvj6dN4jpbGkFdcswayt4GEPDAXhc0qsOS
         dKMNC6TMpTb2TBPGjFhUtFHUFRit8Woy4rYzV4KX2LhYl4YSnpUmPPEzopbyXwgff2h0
         Stqu+7ctOQy3jbf0VCHqKYF13QeZqJHfvP8HWB1zMgQm/v1iz5WJe19ajBBFGdPgrfx+
         /o3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXl5vVHiFc6fkKwW/lC1xeTvakjGsL4VUXO6yGQ19SabBvL1g0S
	qBuT49JCwwGDVw9wCqrx5Jw=
X-Google-Smtp-Source: APXvYqxehnds7QNlhAn6Wo/jXWJT8a26eVMeBN6Iqa7BTR0PSuTBKEns5RY273iyU/umk3OOfP2/Kg==
X-Received: by 2002:a05:6000:1041:: with SMTP id c1mr19463528wrx.99.1566806731110;
        Mon, 26 Aug 2019 01:05:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ec43:: with SMTP id w3ls4214642wrn.14.gmail; Mon, 26 Aug
 2019 01:05:30 -0700 (PDT)
X-Received: by 2002:a5d:4446:: with SMTP id x6mr20495983wrr.11.1566806730503;
        Mon, 26 Aug 2019 01:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566806730; cv=none;
        d=google.com; s=arc-20160816;
        b=cSBndsC96rZQefKWDRvXwFfqquaG4Ex0JqUjEOPxU8YdaVl8Y3u+idrFYfgCFx/yaZ
         wz3PRadwy6S46zWC8xevgUfRULRypzlD9pwF2tnXxaTLyeHq1pTUgE2N7GRW/49OH1jb
         fULlTLmkCd6PAy5uFW3OfZXkDX+sOABTXFcSF0hZiGUe0EHRRjNvD35Wv9zdDzxgJrFX
         xFsZ/pAukj4PXg+oPHhQTaWEOetm00HZSGfTowWmbdfJe3KrxOqjfE6ihrlf5vl/T812
         FoxGYnUpAeS4bCGD4obdIpbdNGOiZT2HVGmH8ljc+alSAPWzKDT4e0S+Pie8kcnNAHYe
         qPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:dkim-signature;
        bh=FBLIousF3JTnIzZPFikyravgbyilR5AW4n93Os8Fzrk=;
        b=UtomDSuQYprYvnbbrkPXXzxubuwT4Zw/5CTTcyobqSjfEU6VYobzIkaY/ErO/v90hI
         l7G2F/ZV0l+AhV2bgorQLmYGZEZM/9S8j7HRGisHdl1z2oRGgOCwbTz9c2haEk+sYbw9
         tuiW+0Jf0hbzjpNx3jT5RrqFT7WoEbJ03z95BeZzYB/dv8D2Xv/vQiksRIpEXd0VHAgB
         KEqMwKnRVnb724P138wnmeZLAE56yfNZS1/bg9bJVp8LEmrfEhWpRXmH4RqgsD7/c9xp
         boj07gBiYg+aj1HiTQ/CT2CUOuMscUqyUiNMaPOmfeMqNNmKuIPH+MsmMFLFF/wKs03z
         7/Ig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=eyNJ4dhb;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by gmr-mx.google.com with ESMTPS id r189si745456wme.4.2019.08.26.01.05.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 01:05:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LinyL-1ieG6p0PsL-00cyci for
 <jailhouse-dev@googlegroups.com>; Mon, 26 Aug 2019 10:05:30 +0200
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: [PATCH] Extend page table size for arm64
Message-Id: <3701F3FF-FF75-4950-B527-B0E6241B2E19@gmx.de>
Date: Mon, 26 Aug 2019 10:05:29 +0200
To: jailhouse-dev@googlegroups.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:aV8NkeoR+rN2DaO9k6cOFtZqCPBrHxOmm2McSpr5mNZE65n4PJj
 sR+qjTewIPCB7/VqpN8SwJ2JD1IzMrhzNHnZWKicI8YODDsfpuzmUu9Dh3pDDArQh3iV148
 H4qy8fuhxrBO0xxbLkV1UzGzU52ZeDbvHMtwnZqs5CM7Dy9+vAn857F6w3XtyRoXmEfXrl2
 QCTNK+rEYXUgGtHBzfLCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ymQ4Cj7MTMU=:oFfLk+gLtVw6lQ8unlvKfh
 euPTY/QB2X/ScAI4TEUFNAhS7NsYbBtKub+3M0OEZWW3hSqImUpYsHsnz/zdA5P07I+Gv3ClY
 ETq01RQIxwj7T74+SdeEzbn9zO03KfO9ssWgdsmqRDA6/mAcc9Sv8oQjWWfvp18tCB8i1StxU
 UYheprFLeG7ZvvYS6mbwB5PBJiDooM+QrDvzQ/s+VMpkhWH8SZy3fCA5ICD89LH2EHctMMddf
 JmGQ1wlRyJzVg7Pd2dKwECQ4KygG2GHvoWPdeSB/DQLq6jen0ej84l0KewOE88RcMAJGlHgv0
 ooUYRwc3Ir4iNpm8nixCPMsLIPTZSPgC2M5GiV1HqOtCs7pyGBupiVJHAgAgtmoOqemFPSiVv
 3s7gGtJBZ5UJzJpGRIH5dy35A5tMPUu2IC/MhhIsa/fYSd8jFp4vNiFto+C9Uyz01dCWKmRD1
 wyj29gFssWedy+bzbq+wIaiqUUdXYHh1nYI9mcsDnlVfjWLAnq+7G9i9HyjKibux3AvXvOqB6
 A/fai2DIwvkqxxgCbqrVXI5U+duY3j+cBItuyXzoUSy5OXFMVT9Zpg/jf/jFZ5za+npldII3c
 wSORiiMgLFPT1ke4WixHhatwxOqGhib1eASoHoM1wVBKAUEGtZ1DO6i6qrncdRuV9dPxmAEGe
 7P5UvWeNIQqX+G/dBVZswinXnXqepp3iIBdxlvUUrzwx5yq49PXAXKa6DPub1PaL+zL0iwrUe
 BMGLIdfmoi4iKsnhkhQcaK+zR/cGpn51j5FaGWOdFuYILIz1BJBmTkhG5bgGqiogdgcFS9BIj
 k0GTD5zw5iUkuThwUT2DI+E1Wk1n6rd2dsQheu+T1nQFQ2Xdz32wqxf3/upjThnXrfpLvBnS+
 SwwFKi3KncwU4F/StiYZzFGNvaHZRfb7tnFbh3DO6kDR+JHz15MVx58aRsl3WKZT4i7pZ7YGG
 CxsARblJkvZC+ypn5zOSTvG0PNO9eBI3p+vrPS0XhuQUsaOENinUKvqYtjY5MgefXK0Iy93fL
 DJSNx8oGcF5llbZS257ALCFXIjXRvcoIyaZImF/sjChUuxJCVegkQAcCQy6WwmkvbnTR/e1Mf
 dypODCd9G4wd0ZNDD1lEG0+vRfPNwnoZzDV+6yYFOjg8SkWTAuT6V2hGSx6A5B1qE+QzJ5e4T
 Twijs=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=eyNJ4dhb;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.22 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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

On arm32, the index to the page table is 2 bits (bits [31:30] of the
virtual address). On arm64, the index is 9 bits (bits [38:30] of the
virtual address). The page table must be extended accordingly.

Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
---
 inmates/lib/arm-common/mem.c            | 3 ++-
 inmates/lib/arm/include/arch/inmate.h   | 6 ++++++
 inmates/lib/arm64/include/arch/inmate.h | 6 ++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/inmates/lib/arm-common/mem.c b/inmates/lib/arm-common/mem.c
index 8090f7b..e03e23c 100644
--- a/inmates/lib/arm-common/mem.c
+++ b/inmates/lib/arm-common/mem.c
@@ -39,7 +39,8 @@
 #include <inmate.h>
 #include <asm/sysregs.h>
 
-static u64 __attribute__((aligned(4096))) page_directory[4];
+static u64 __attribute__((aligned(4096))) 
+	page_directory[JAILHOUSE_INMATE_MEM_PAGE_DIR_LEN];
 
 void map_range(void *start, unsigned long size, enum map_type map_type)
 {
diff --git a/inmates/lib/arm/include/arch/inmate.h b/inmates/lib/arm/include/arch/inmate.h
index 0df386c..0c4cbfe 100644
--- a/inmates/lib/arm/include/arch/inmate.h
+++ b/inmates/lib/arm/include/arch/inmate.h
@@ -36,6 +36,12 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
+/*
+ * 4 L1 translation table entries for arm 32 bit architecture
+ * indexed from bits [31:30] of virtual address.
+ */
+#define JAILHOUSE_INMATE_MEM_PAGE_DIR_LEN (4)
+
 void __attribute__((interrupt("IRQ"), used)) vector_irq(void);
 
 static inline void arch_disable_irqs(void)
diff --git a/inmates/lib/arm64/include/arch/inmate.h b/inmates/lib/arm64/include/arch/inmate.h
index dd1cc33..3526793 100644
--- a/inmates/lib/arm64/include/arch/inmate.h
+++ b/inmates/lib/arm64/include/arch/inmate.h
@@ -36,6 +36,12 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
+/*
+ * 512 L1 translation table entries for arm64 bit architecture
+ * indexed from bits [38:30] of virtual address.
+ */
+#define JAILHOUSE_INMATE_MEM_PAGE_DIR_LEN (512)
+
 void __attribute__((used)) vector_irq(void);
 
 static inline void arch_disable_irqs(void)
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3701F3FF-FF75-4950-B527-B0E6241B2E19%40gmx.de.
