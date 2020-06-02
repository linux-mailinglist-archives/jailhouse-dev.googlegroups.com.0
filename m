Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVV63H3AKGQEBBE62LI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E81EBDD5
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:55 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id i20sf3498022lfo.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107414; cv=pass;
        d=google.com; s=arc-20160816;
        b=YkCR5NCuhXAOXSVipl7yxv8R8Ph1iDwhmgezGxw25Isc5mYf3bT3ng6OBj7nL1gt/k
         +cemjnsfBhdBbSaN9vBGHe9GCNZMhS0ret3JOHi5i2CAZGycaQFBF7gq/7mS+TTOEGEy
         ZZsFqD40cbTszR703ITLuWS+GUBVSeQ+eprYybwzCeDlxVMO3Fn02ngyx9pfuuAypfTC
         +b4fWzBizVpPbSBSCaql833otVZw2KtlHi1aWtFACQjCzvsD6cYQv/0T/HFVLbHJiLTx
         tcbYx2R0kHgO2Nv2qVn0WGI/VC+g3IDot9cWy4Ur2FpIXMPl7rtpucW+K2GMHS6/hI1G
         qbZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=45FWmul6ANYuioxQhIRjlXRYMYyNnozqA+BEDTHwexA=;
        b=AbpnX+RO7GNXPIQpSpYXV0NzFLvNOlZiEIlgS1GQyUx6SoqAYC3yKUiV8NgrqiNzaT
         rxfUfeemw+3IyGnihix03bcI5GNCv3JzF82y7CPV1rC0aXbtobcGhtIxyPlOwEuDSMaJ
         vysa5ttowTRdjj9qZW+i3VZIRxd5/8K4dlulBWn4Fi2KtxAe1mv93sdNsdRWgo8kZy8a
         mCBYUA06vBxBlkMJ+zcjziJu+JDmJaJJO7OSVloJXXwDwHKMzfMIKDLiB32l3G+tjnlV
         ENnHwaarvQIwOHbqgkHmCJWpJR6otu6wYDFCYpV0oXQT47OdYRM1ACUuLioG3l88JYrT
         ge3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=45FWmul6ANYuioxQhIRjlXRYMYyNnozqA+BEDTHwexA=;
        b=UHn4cq711JnuxJiu3sYe8xlHkay3hoVHT1WG2g3XLD4MVtq5XJNi6Som0DNRUPbV0z
         ZfokiyT7JK3yPyKj2ERKocrWPQBy75U7tBOM3tTl/9LpociYgjrzYKIMYwb3kBiQ4X0R
         EhBiscyEguza45T6XC8KRul2zvRM7ei9jzVxND2ywg3DOQGmcx6rw0krhf3jMLKndkvG
         co0ZK44qAjivq3VKHKcEVi1Neo2fdpkyscUoOEoLPZ2MfmSDDUXlHT+SvBsXYT1KqZJT
         SnY7l0Dv2JXz8vhgwvWx/r0B31eUrPTIO2agSidzGDKIt5kXm3h/UD9fzEKdKZhIBzoV
         Sdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=45FWmul6ANYuioxQhIRjlXRYMYyNnozqA+BEDTHwexA=;
        b=VkFS+0+P427himRpNlu3JSd64WXivc/za5QVhHQwzHYib1p85AWESAUsydFhekyiHJ
         iAvcOgWC6FfJPXqzrW/WxF8z+3Kje2mgolldB4v851rbMYQmse3kFzpIu25/imQ9SqS+
         5DR1HvDDCDbeEODdbPSp1qeg1cNXgrbvWFW3Qe9xMaYs4AVTF3atvL+QmaLvNChTMf85
         /19Ial+TNI/6E4mW5aWpDqKFfxXvxaOyCq3tZcCPZubC1/jUvLoTKs3+t3JvtKXYqScW
         +v/GzJTEFpfgd9YYSJVknd0dnnKnccgId/ceoERdiEW7SDc4QLaoLHU412yoxmdGSjMv
         kXGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5310mFoZHPvae9JxpKXP2Pk/s/05yonN9AkJ7otA/8XSwFoJxDB1
	ffqdFgKuNxkOa5D7RJ0Y4Ak=
X-Google-Smtp-Source: ABdhPJzKlZS4QGDY3ufPN/ZZ9CjDOSm0tRW5XRQerLAfeW8NwU/3qu5ZmQe19HlxTPAWsTPyQ+ONnQ==
X-Received: by 2002:a2e:b17a:: with SMTP id a26mr6453194ljm.348.1591107414613;
        Tue, 02 Jun 2020 07:16:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b61c:: with SMTP id r28ls374705ljn.5.gmail; Tue, 02 Jun
 2020 07:16:53 -0700 (PDT)
X-Received: by 2002:a2e:1506:: with SMTP id s6mr13094193ljd.296.1591107413733;
        Tue, 02 Jun 2020 07:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107413; cv=none;
        d=google.com; s=arc-20160816;
        b=GNFKD8iZz9WZSyP8v0fGBch6/KOvurrXFqst8BD/WZFdsefmOBzXR38DDZ/Kbf7/EW
         vyHf9s6RmtpKYEiJK8KIGjD4iIM6wv7R7hNkPUivmw9kDPzTFl9itjkoSVPhXInY69Hc
         JqXdXhH+pjRPS4CnhmQqrhnIPJlI8aq8F+nROmQFTrpl7Y7qtZkMazSqiHyPuBo/Daep
         I5xMPGSOQgiibzLEvkydAcnp0GoGq8FNsRHyiFqGstdhlnV4rlwl7eQ7WfOlH2XGptSB
         9DAZXr/fhD2xrBseOlnld/mJdkpE/SmQNvxRE3yWa6/ChoWVCyaHHdqycgaB4EeUP4Jc
         OOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=8uhE1URRs8Qk+lflbceuUoEVenODtqxIR4exTcApV1w=;
        b=J61wJ8bgJaM9sN7VHVddMkHGur66/noEkUuZZJUCuOTVdEP5ZLynktxrXGnjkpAzAx
         ExqnImSgzUwMjAjWenimKT6SjcrrTgLGd23zOZkUIFuVL6/UZdhF3cJjK8UmGM5WTLWv
         IkV91z7JKrEljKu0E8rbnki/x/YJfI9hkIw1Q9ZcPrNvKotSbHf2Pe5dif4cwFFKGiZN
         C8FKi05aHSAj+CZOKnYPmtJvm3yVl/G1i7oCklclNa40Ee/elTthDU4TalyNvOEGKuIr
         yUBwTBn9nY3+H7wx3K5JLAlySxO9mfSP8BQbv0H2kM12MHsHLfmENNj/kzCZoLSuzbcg
         Vl2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id c144si145199lfg.5.2020.06.02.07.16.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 052EGr7Y000822
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:53 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdJ028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:52 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 10/15] tools: Add jailhouse configuration checker
Date: Tue,  2 Jun 2020 16:16:33 +0200
Message-Id: <79df6c32d6fbdc649b3a781128ebcbd3ff6b3d79.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

This lays the ground for offline configuration checking. The checker is
mounted as "jailhouse config check", accepting the binary root cell and,
optionally, any number of non-root cells.

So far, only one check is implemented: Finding overlaps of memory
regions within a cell. But already this reveal a number of pending
issues in our in-tree configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/Makefile                  |  2 +
 tools/jailhouse-completion.bash | 26 +++++++++-
 tools/jailhouse-config-check    | 89 +++++++++++++++++++++++++++++++++
 tools/jailhouse.c               |  1 +
 4 files changed, 116 insertions(+), 2 deletions(-)
 create mode 100755 tools/jailhouse-config-check

diff --git a/tools/Makefile b/tools/Makefile
index 542127cf..8b4ebf14 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -57,6 +57,7 @@ HELPERS += \
 	jailhouse-cell-linux \
 	jailhouse-cell-stats \
 	jailhouse-config-create \
+	jailhouse-config-check \
 	jailhouse-hardware-check
 TEMPLATES := jailhouse-config-collect.tmpl root-cell-config.c.tmpl
 
@@ -65,6 +66,7 @@ install-libexec: $(HELPERS) $(DESTDIR)$(libexecdir)/jailhouse
 	$(Q)$(call patch_dirvar,libexecdir,$(lastword $^)/jailhouse-cell-linux)
 	$(Q)$(call patch_dirvar,datadir,$(lastword $^)/jailhouse-config-create)
 	$(Q)$(call patch_pyjh_import,$(lastword $^)/jailhouse-cell-linux)
+	$(Q)$(call patch_pyjh_import,$(lastword $^)/jailhouse-config-check)
 
 install-data: $(TEMPLATES) $(DESTDIR)$(datadir)/jailhouse
 	$(INSTALL_DATA) $^
diff --git a/tools/jailhouse-completion.bash b/tools/jailhouse-completion.bash
index 32d6ba46..09a9a1ed 100644
--- a/tools/jailhouse-completion.bash
+++ b/tools/jailhouse-completion.bash
@@ -1,7 +1,7 @@
 # bash completion for jailhouse
 #
 # Copyright (c) Benjamin Block, 2014
-# Copyright (c) Siemens AG, 2015-2016
+# Copyright (c) Siemens AG, 2015-2020
 #
 # Authors:
 #  Benjamin Block <bebl@mageta.org>
@@ -291,6 +291,25 @@ function _jailhouse_config_create() {
 	return 0
 }
 
+function _jailhouse_config_check() {
+	local cur
+
+	cur="${COMP_WORDS[COMP_CWORD]}"
+
+	options="-h --help"
+
+	# if we already have begun to write an option
+	if [[ "$cur" == -* ]]; then
+		COMPREPLY=( $( compgen -W "${options}" -- "${cur}") )
+	else
+		# neither option, nor followup of one. Lets assume we want the
+		# target-filename
+		_filedir "cell"
+	fi
+
+	return 0
+}
+
 function _jailhouse() {
 	# returns two value: - numeric from "return" (success/failure)
 	#                    - ${COMPREPLY}; an bash-array from which bash will
@@ -304,7 +323,7 @@ function _jailhouse() {
 
 	# second level
 	command_cell="create load start shutdown destroy linux list stats"
-	command_config="create collect"
+	command_config="create collect check"
 
 	# ${COMP_WORDS} array containing the words on the current command line
 	# ${COMP_CWORD} index into COMP_WORDS, pointing at the current position
@@ -381,6 +400,9 @@ function _jailhouse() {
 
 				_filedir
 				;;
+			check)
+				_jailhouse_config_check || return 1
+				;;
 			*)
 				return 1;;
 			esac
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
new file mode 100755
index 00000000..23e6ae26
--- /dev/null
+++ b/tools/jailhouse-config-check
@@ -0,0 +1,89 @@
+#!/usr/bin/env python
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+# This script should help to create a basic jailhouse configuration file.
+# It needs to be executed on the target machine, where it will gather
+# information about the system. For more advanced scenarios you will have
+# to change the generated C-code.
+
+from __future__ import print_function
+import argparse
+import os
+import sys
+
+# Imports from directory containing this must be done before the following
+sys.path[0] = os.path.dirname(os.path.abspath(__file__)) + "/.."
+import pyjailhouse.config_parser as config_parser
+
+# pretend to be part of the jailhouse tool
+sys.argv[0] = sys.argv[0].replace('-', ' ')
+
+parser = argparse.ArgumentParser(description='Check system and cell configurations.')
+parser.add_argument('syscfg', metavar='SYSCONFIG',
+                    type=argparse.FileType('rb'),
+                    help='system configuration file')
+parser.add_argument('cellcfgs', metavar='CELLCONFIG', nargs="*",
+                    type=argparse.FileType('rb'),
+                    help='cell configuration file')
+
+try:
+    args = parser.parse_args()
+except IOError as e:
+    print(e.strerror, file=sys.stderr)
+    exit(1)
+
+print("Reading configuration set:")
+
+try:
+    sysconfig = config_parser.SystemConfig(args.syscfg.read())
+    root_cell = sysconfig.root_cell
+except RuntimeError as e:
+    print(str(e) + ": " + args.syscfg.name, file=sys.stderr)
+    exit(1)
+cells = [root_cell]
+print("  Root cell:     %s (%s)" % (root_cell.name, args.syscfg.name))
+
+non_root_cells = []
+for cfg in args.cellcfgs:
+    try:
+        cell = config_parser.CellConfig(cfg.read())
+    except RuntimeError as e:
+        print(str(e) + ": " + cfg.name, file=sys.stderr)
+        exit(1)
+    non_root_cells.append(cell)
+    cells.append(cell)
+    print("  Non-root cell: %s (%s)" % (cell.name, cfg.name))
+
+ret=0
+
+print("Overlapping memory regions inside cell:", end='')
+found=False
+for cell in cells:
+    for mem in cell.memory_regions:
+        idx = cell.memory_regions.index(mem)
+        for mem2 in cell.memory_regions[idx + 1:]:
+            idx2 = cell.memory_regions.index(mem2)
+            overlaps = []
+            if (mem.phys_overlaps(mem2)):
+                overlaps.append("physically")
+            if (mem.virt_overlaps(mem2)):
+                overlaps.append("virtually")
+            if overlaps:
+                print("\n\nIn cell '%s', region %d" % (cell.name, idx))
+                print(str(mem))
+                print(" and ".join(overlaps) + \
+                    " overlaps with region %d\n" % idx2 + str(mem2), end='')
+                found=True
+                ret=1
+print("\n" if found else " None")
+
+exit(ret)
diff --git a/tools/jailhouse.c b/tools/jailhouse.c
index 72e7e98e..049b5bb6 100644
--- a/tools/jailhouse.c
+++ b/tools/jailhouse.c
@@ -52,6 +52,7 @@ static const struct extension extensions[] = {
 	  "[--mem-inmates MEM_INMATES]\n"
 	  "                 [--mem-hv MEM_HV] FILE" },
 	{ "config", "collect", "FILE.TAR" },
+	{ "config", "check", "[-h] SYSCONFIG [CELLCONFIG [CELLCONFIG ...]]" },
 	{ "hardware", "check", "" },
 	{ NULL }
 };
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/79df6c32d6fbdc649b3a781128ebcbd3ff6b3d79.1591107398.git.jan.kiszka%40siemens.com.
