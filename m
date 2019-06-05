Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBPGW37TQKGQE3YI6LXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB8F36104
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jun 2019 18:18:05 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id a1sf2273761lfi.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jun 2019 09:18:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559751485; cv=pass;
        d=google.com; s=arc-20160816;
        b=T+UAKGWbhcqVBj6iIJ5nVovk/0In2YI1NmLHclBT7xxFfpMhza7WZy9tNZGdaaKJJ4
         A1+lMZB8MtpK4PKwdnOpl/lH15csgQGH2UknyPBopTDvGjoDpQA56eC/c5vAtJ4alD7X
         3nkigQ+7Nnpdssi8f6uBbneHZGZMStI3fKv+l6OMvVoT1zSFxmiLVLXcMFgs8M9LTbEc
         BGxEhvOxCYGjPD6PyXW4KIgIiEMxOO6lpd57OXpdgAaRt5i3ck9dgd8yi+6x2ZqrKpZ+
         iIg3TwHyT3o3swb+8yylgpCMF2pL7cuA6YmONKylhqOWXlZazcXouYzvDTfQrv+ETOa2
         pDVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=aELBtDFxn9534PRMgb4BiEB5W9P6qQyIDjzd4OJ/Oh0=;
        b=Di++yoFQ59dhxsd83Ij/4zPWKoUfWLq2Y+unjpn8opiB8bpDKQh3QbkpWWbMz3qrde
         utn0TEsEgTFQ/GaigtLi+lFRvGvkq3KcBuh8EL9CAny1RCA1Sga2AZGO8fbozM427kAy
         3b9WGhjiJpLLmpRXw9cBIAmflkSCSN67mDvLW4TG4Q8GKTG6FdzV5pp9hs2/1HVIq+zB
         TTksy8MSu+/NxmpPbkssMjVWkTQLoF53pvGroDTAndE62jJK4GCibwl+q2fXJBLd7aFx
         R5TbwEC9DrTUydNn8YJ4oAF3cPxKBtxtr+D+uuFtwuoudm+6DDJhLJZGqOgCTwkAyO/3
         r8tg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aELBtDFxn9534PRMgb4BiEB5W9P6qQyIDjzd4OJ/Oh0=;
        b=Ttlh55oaMjvwjpd8f34VYw1WeVgZ8mupRWFKig91nKT4Go3WQ6houw++PCeWLMNW2g
         ZY7+wVN0DqgS+03mpjS+zFgrJ9EyJmMiKBzZH0jH4fTwRBMXfoIhdv7k1sVT1cCbLQ8l
         gkOmzzLnSTaR3hRmHn0q5K9tYItFItGZJ7Dj/tWDmtvCqxMB/Y/30dGHDCzjc5n6adJB
         F4hPKjb2DgyTJbIh92oJ4sF9LxE1ETBpRUrd7vdU5r3ktvkTt56I57Kfw2jPIVWCOTBb
         QqWtq8pfta9L8GduKZhOVIIkI/NQyNnPYvWNUhJksIccwoBBdPDb7D6CFtRCRNyo25B7
         Enbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aELBtDFxn9534PRMgb4BiEB5W9P6qQyIDjzd4OJ/Oh0=;
        b=h0Z5jRVPH6o4q5miKzZPOSVFjtjLh8nMgWmpCs7i4ZsWWMupeHA5CRWnzaCOhoIYKq
         bvntDUlqfbhegz3OuZBwoWi8dcxWIKfhjccH0b7ZtFQV/n87PFR/BC3lvLTkdgWPF8vL
         m5sinBS2bHQ36pOVRLkiZMdSRf/sHcM8sZptlj8wJqBj5lRLyKeFiSe/KjM5alL8ITpJ
         F4Cyz0/nUR96IJpnIxyAhBeY1Dp38ztUIg2VhYo2tDN5yhmc4LFOcSDPSTFngbQKBJBW
         t668pPo5ABqnDk7opI0t2SHyxDgj2TWLJ+a4VRbXn2uXZ/+LSEEkFsf1SEsH9X2EA7aJ
         o+dw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVNJrY1qyRYtGpkcT71b6j9HXtfTF5B/650ZxYnQ87q3uYUqr2k
	bWDgc+UNSf+hYS2qQSuVDZY=
X-Google-Smtp-Source: APXvYqxCdQyWxH27Twq781FttLZALT3ZsXHQpbVHhmSrx1zRSMxkP2IPJ7nKtfdusZvvlhy9B3Yk8w==
X-Received: by 2002:a19:9545:: with SMTP id x66mr19888160lfd.94.1559751484887;
        Wed, 05 Jun 2019 09:18:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4a67:: with SMTP id q7ls245711lfp.2.gmail; Wed, 05 Jun
 2019 09:18:04 -0700 (PDT)
X-Received: by 2002:a19:4c05:: with SMTP id z5mr12271209lfa.5.1559751484130;
        Wed, 05 Jun 2019 09:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559751484; cv=none;
        d=google.com; s=arc-20160816;
        b=tX4YUuV4akDGevUAT+HJN6lpZ4589IU/RdkT2Ou3x3O+jeLCW6InRjSqN76uTvv7EA
         qQ/yFzhjS7ITYzSDf4K9gmjBVF0+7I0bVXRnD8UZbrVv9zwhCT8gATI1WcqpCDc3zM5j
         yAoy5sn45ZNUf3tUdd/iEgdzFCSeRuG1O8SU+dvDdYDs0IUev2KuHCYE/lfwuhSyl7xh
         T/7hQEh3YM1eT0dpp+udywCjCbu3mlvY0GbA6G/DiyQtLz6oKZBzzg1MTEP2AuWKEPXR
         tS4PiQa1/oOzntSNlbLdskbW5cxctKFo4c/7uFZqFtJz2OXpvxBbBTVeA8llO2H93dvG
         HeTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=uC9OPzUqZKSRaJdhdx8dgeaRP77kchVLUcolXlxwDgo=;
        b=KA1rphKw3zULlMiED39KkErTksK4+N1MZ0/NfuHjdEReHV5kYwquT1z6+l/NW7etpr
         mwNZZa5XIOjDv8ui7bjimCY0A1hXLKqYCFFxNRrGNMLotmntgkIUYF0XXMfei0oFI6+d
         bIxsMfHAMMQnkVZdA5mjPIfpDBY5sEBA7rZf5z2FL9RPsPWBLze6+uhypV7HSAid/93P
         cHX6EmrdSYRnf8nusV5nEi+AYZMOUH22wtqKqvCmYwrQBkdN4AgPgfvZpoY+Q5g4NIpf
         G65rrsFit9ZqknSRK/Sk3eqRvEEm+sR7sOCwPQTXf/6R2UTzUSlIUaACgOtsl+esTXvw
         dGbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id c15si683533lfi.5.2019.06.05.09.18.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 09:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from localhost.localdomain (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Jv8q0ZlCzyBH;
	Wed,  5 Jun 2019 18:18:03 +0200 (CEST)
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@web.de>
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 2/2] pyjailhouse: x86: implement pio_bitmap generator
Date: Wed,  5 Jun 2019 18:17:45 +0200
Message-Id: <20190605161745.2389-2-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605161745.2389-1-andrej.utz@st.oth-regensburg.de>
References: <20190605161745.2389-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.5.161216, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.5.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RCVD_LOCALHOST_LOCALDOMAIN 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NAME_BODY 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of andrej.utz@st.oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

This replaces the old static port list with actual port regions from
'/proc/ioports'. The static regions from said list are kept and override
the data in case of region overlap to retain compability.
The generated port list is virtually identicall to the old one but eases
manual configuration.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py   | 135 ++++++++++++++++++++++++++++++++++
 tools/jailhouse-config-create |  14 +---
 tools/root-cell-config.c.tmpl |  15 ++--
 3 files changed, 142 insertions(+), 22 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 56265fb5..d06a476a 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -142,6 +142,57 @@ def parse_iomem(pcidevices):
     return ret, dmar_regions
 
 
+def parse_ioports():
+    regions = IOMapTree.parse_ioports_tree(
+        IOMapTree.parse_iomap_file('/proc/ioports', PortRegion))
+
+    tmp = [
+        # static regions
+        PortRegion(0x0, 0x3f, ''),
+        PortRegion(0x40, 0x43, 'PIT', allowed=True),
+        PortRegion(0x60, 0x61, 'NMI', allowed=True), # NMI status/control
+        PortRegion(0x64, 0x64, 'NMI', allowed=True), # ditto
+        PortRegion(0x70, 0x71, 'RTC', allowed=True),
+        PortRegion(0x3b0, 0x3df, 'VGA', allowed=True),
+        PortRegion(0xd00, 0xffff, 'PCI bus', allowed=True),
+    ]
+
+    pm_timer_base = None
+    for r in regions:
+        if r.typestr == 'ACPI PM_TMR':
+            pm_timer_base = r.start
+
+        if r.typestr.startswith('ACPI'):
+            r.allowed = True
+
+        tmp.append(r)
+
+    tmp.sort(key=lambda r: r.start)
+    ret = [ tmp[0] ]
+
+    # adjust overlapping regions
+    for r in tmp[1:]:
+        prev = ret[-1]
+
+        # combine multiple regions under the same bit mask
+        if prev.aligned_stop() >= r.aligned_start():
+            if r.stop > prev.stop:
+                n = prev
+                while n.neighbor != None:
+                    n = n.neighbor
+                n.neighbor = r
+            continue
+
+        # forbid access to unrecognized regions
+        if prev.aligned_stop() - r.aligned_start() > 0:
+            ret.append(
+                PortRegion(prev.aligned_stop() + 1, r.aligned_start() - 1, ''))
+
+        ret.append(r)
+
+    return (ret, pm_timer_base)
+
+
 def parse_pcidevices():
     int_src_cnt = 0
     devices = []
@@ -769,6 +820,65 @@ class MemRegion:
         return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'
 
 
+class PortRegion:
+    def __init__(self, start, stop, typestr, comments=None, allowed=False):
+        self.start = start
+        self.stop = stop
+        self.typestr = typestr or ''
+        self.comments = comments or []
+        self.allowed = allowed
+        self.neighbor = None
+
+    def __str__(self, chained=False):
+        # as in MemRegion this method is purely for C comment generation
+
+        # deviceless region
+        if self.typestr == '':
+            return ''
+
+        s = ''
+        if chained == False:
+            s += 'PortRegion: %04x-%04x : ' % (self.start, self.stop)
+
+        s += self.typestr
+        if self.neighbor:
+            s += ' +' + self.neighbor.__str__(True)
+
+        return s
+
+    def size(self):
+        return self.stop - self.start
+
+    def aligned_start(self):
+        return self.start - self.start % 8
+
+    def aligned_stop(self):
+        return self.stop + (7 - self.stop % 8)
+
+    def bits(self):
+        # in this method: 0 = allowed,
+        # outside: 0 = disallowed
+        if self.allowed:
+            bits = ((1 << (self.size() + 1)) - 1) << \
+                (self.start - self.aligned_start())
+        else:
+            bits = 0
+
+        if self.neighbor:
+            bits |= ~self.neighbor.bits()
+
+        return ~bits & 0xFF
+
+    def bits_str(self):
+        b = self.bits()
+        if b == 0:
+            return '0'
+        elif b == 0xff:
+            return '-1'
+        else:
+            return hex(b)
+
+
 class IOAPIC:
     def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
         self.id = id
@@ -932,6 +1042,31 @@ class IOMapTree:
 
         return regions, dmar_regions
 
+    # recurse down the tree
+    @staticmethod
+    def parse_ioports_tree(tree):
+        regions = []
+
+        for tree in tree.children:
+            r = tree.region
+            s = r.typestr
+
+            if len(tree.children) > 0:
+                regions.extend(IOMapTree.parse_ioports_tree(tree))
+                continue
+
+            # split in byte sized regions
+            while r.size() > 8:
+                # byte-align r.stop
+                sub = PortRegion(r.start, r.start + 7 - r.start % 8, r.typestr)
+                regions.append(sub)
+                r.start = sub.stop + 1
+
+            # add all remaining leaves
+            regions.append(r)
+
+        return regions
+
 
 class IOMMUConfig:
     def __init__(self, props):
diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 55601a6d..d25071ce 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -163,17 +163,6 @@ def count_cpus():
     return count
 
 
-def parse_ioports():
-    pm_timer_base = None
-    f = sysfs_parser.input_open('/proc/ioports')
-    for line in f:
-        if line.endswith('ACPI PM_TMR\n'):
-            pm_timer_base = int(line.split('-')[0], 16)
-            break
-    f.close()
-    return pm_timer_base
-
-
 class MMConfig:
     def __init__(self, base, end_bus):
         self.base = base
@@ -302,7 +291,7 @@ regions.append(inmatereg)
 
 cpucount = count_cpus()
 
-pm_timer_base = parse_ioports()
+(ports, pm_timer_base) = sysfs_parser.parse_ioports()
 
 debug_console = DebugConsole(options.console)
 
@@ -312,6 +301,7 @@ tmpl = Template(filename=os.path.join(options.template_dir,
                                       'root-cell-config.c.tmpl'))
 kwargs = {
     'regions': regions,
+    'ports': ports,
     'ourmem': ourmem,
     'argstr': ' '.join(sys.argv),
     'hvmem': hvmem,
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index b6ac8637..c85a671c 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -153,16 +153,11 @@ struct {
 	},
 
 	.pio_bitmap = {
-		[     0/8 ...   0x3f/8] = -1,
-		[  0x40/8 ...   0x47/8] = 0xf0, /* PIT */
-		[  0x48/8 ...   0x5f/8] = -1,
-		[  0x60/8 ...   0x67/8] = 0xec, /* HACK: NMI status/control */
-		[  0x68/8 ...   0x6f/8] = -1,
-		[  0x70/8 ...   0x77/8] = 0xfc, /* RTC */
-		[  0x78/8 ...  0x3af/8] = -1,
-		[ 0x3b0/8 ...  0x3df/8] = 0x00, /* VGA */
-		[ 0x3e0/8 ...  0xcff/8] = -1,
-		[ 0xd00/8 ... 0xffff/8] = 0, /* HACK: PCI bus */
+		% for p in ports:
+		[${ '%6s' % hex(p.aligned_start()).strip('L')}/8 ... ${
+		    '%6s' % hex(p.aligned_stop()).strip('L')}/8] = ${'%4s' %  p.bits_str()}, ${
+		    ('/* %s */' % (str(p).split(':', 2)[2].strip())) if len(str(p)) else '' }
+		% endfor
 	},
 
 	.pci_devices = {
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190605161745.2389-2-andrej.utz%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
