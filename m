Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5PDZL3AKGQEDE5SV7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7EA1E9354
	for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 21:20:22 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id v14sf429625ljk.18
        for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 12:20:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590866422; cv=pass;
        d=google.com; s=arc-20160816;
        b=vxCq3is5OVXuO0mY0wDpAbJ4Dh6B+cy1HsTQofMk4LbHhfhvnkyziwXPiV5Vt1mTzT
         f6y9ifw3xikpKtoJC2KSoCgh4XVCwRZGOrao7mVvENLu+uujtCTc44hSEXFV1GU8C5aN
         KSAIQHtZko/Jo5wdHVR6MhceGgTvzNc7nQcPv08cQLN6LvCP+bmWsUJWjE51peHgoKuo
         ShFXwTi/7PADJu56k14gAnEVRQuLb3NNgGYmuHlJSs9FdnM34GZuINaDWoqIQwwV2d4I
         76rGcHDDptN9hV1hxgpUEMPILIDc5WJVPdgB+98o7jQz2CHUpE8FHZt/MCAuabE8JJ3t
         uZyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=auec9HHz0I0EQbkTr4hzw5jzQGomk9n8sc5exwS6LWY=;
        b=nUYZDsOuvd0ZrVYCHskcyJBsS9UgEf5YZCcGX3sBRBXHg1xn33TWL14JxmNHrELos8
         HYvf/4dkQ3Vtqvbu7BJmCPcmKQhbbX9hilyNRyIMWF7nASj99GMGg2cSP8IsAcnhCjN6
         5TNb3nk2wexWguoAv08BfGL+XDTXKhssBrOfRtrhwmatVAgracdejka0q+uEq+PNHXB0
         tVxDL0mYzl8J59/VUREBVUZysOOn4ApKp98kdNuDvyMzeOR7vjVMMhdmldgk1MfKquvk
         g2kTVFY3LZS//ER5z+Pf6dTdnfo3HZXX9nGYMRWfqrgHaKYYmgPPkZUHqQKPnSGJCRVU
         Jdhw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=dKm6Qg8B;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=auec9HHz0I0EQbkTr4hzw5jzQGomk9n8sc5exwS6LWY=;
        b=JgILkgXid+srcLj+uSsLPMdeqmmlSJdkrTEs0irEG/wSCVm6wdaCZnVXVboVswYz6k
         W9pgWh3d+DjRTrocggSixYQ0nPAK4SzKfD4APSEKoQRNm5jmnHXsyF0Vdx7PZThOwjzv
         lU/0BHTpBsqP7ffhPD9tT3xOS0rSwvnhysfCx/lv0+m5a0j9Q15FDYcsHx0Lvgs2Ldt4
         PD+O34uXBCsjY3TPvpYfjI/qOZqAVtwmt180So9M7wvU1vuL44Fb8Q8Fe4ckXIyOirks
         jrdCnhSXR6ELY6gcMcLojlN7MizFXnAz95CQdeEXQg/hxitikqj5A9S3qDSI97CV7NgD
         z29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=auec9HHz0I0EQbkTr4hzw5jzQGomk9n8sc5exwS6LWY=;
        b=aC9ys+e646lyJX50QSmTaDxTDGz7VkunAMFgeQgi/x81hTN1Lc6RkehgHn9Kh2lWKw
         HBTGnLl486TZDKIMrencfyxLKJPTt083O5eQJ9fjg6sJ+yxcaYvT3j9oPb/6hadBTaFU
         9OkQVLeH/A2FuvptMlDj0mIBIT5QJ9aZJkqdbZadR4F/7VbECcMDDhH5vaRwAAnKTowS
         Zot66XN7/AaeEzF0NpGBJXXB2LLUbpJK2sTgNPcMvMZ0YKpsCO72n0faRqAsMxasNdHS
         cwfVJlk/Yh2Vq0Pome+Kr/yFJlmWjzOZ80qJu++fTpPtz0Y9FIEFvkUl6mKqOYSUdER0
         eDpA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ak9zjp+lP34JCrVktj+QEFzXDcOi3UHZGq5/fuGQdz4bukfCI
	QEu/Ump+oRAX1NDlwBnNfCg=
X-Google-Smtp-Source: ABdhPJwKOdouT+giPHHo/epzWnPrNpxsdfubmDgbfNtPaiYS3NgSc8tc67MiGl2q7CMSPUetbFrb/g==
X-Received: by 2002:a05:6512:60f:: with SMTP id b15mr7362790lfe.159.1590866422012;
        Sat, 30 May 2020 12:20:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a53:: with SMTP id k19ls985887ljj.9.gmail; Sat, 30 May
 2020 12:20:21 -0700 (PDT)
X-Received: by 2002:a2e:9193:: with SMTP id f19mr7553746ljg.44.1590866421331;
        Sat, 30 May 2020 12:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590866421; cv=none;
        d=google.com; s=arc-20160816;
        b=K1vcBzs4F+B4Tgi2rFg2h+BRql0tL0GhZG+Hzt6XCrwf8T675pmiPDXG2v06tjyQiz
         BUYkT6fQ422WHyrhnKPfUv4pz7wb1/j6C30Ewa6grqJVb5gG//7M/WnIIod2BeVzjbs3
         qRdvoXkch9C7FeAEm9kcOYQgZ+m7Xi2w1Gqf5IluW5zuYrGe8+CFOPW69RNTiRpf/A9T
         Qg8N+uCcBR437THJ5TasXoJTQMRdTRxWw7vaHyM6FJZpMtZCqPxNI32rpicvs11+582j
         GfojtIjrdyRXWrNkFpxW5oMQZS+5nfq1iNLpuq0p1tIk1IvS70AN1NOycJNsw5KP6c5w
         iMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=VQaX0dXxuNSkj1hdi3wbm5LIhDvtnnUOm1oIGNAxN34=;
        b=IkNfB+Z08/3W2ZHl/NsTN9Avlz5CazKwKkG1sIqHOr/Ve9poZshcC9ZnJ9UpmICDfA
         a2BH/NjMxSIZjHugLfML87L9SiW2SDJU1GlPAa1JOZQXb1M2sEcSr+IlDBpyKTIStHW3
         vspVMZw+pPNRYDfP7AYktP7+jiam2otmS2hyhBSZLRHA1JvkkibOgGghmDoEh4q9tEBJ
         uE4TOSyj2aBTlB7WE4xXn2NdEipRvBRCBheTpLTk40oByPy+4gXQGffcu7feE4zwu2iA
         4VxN11rBCHAZdKwf3twW9ndrJ9ou7L/wSZ/YNSYdFZ0ly2nQb9P27KPAYwRh2ICcogCW
         R9KA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=dKm6Qg8B;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id r21si736535ljp.0.2020.05.30.12.20.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 12:20:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MTOli-1jZexM2XjI-00TuNl for
 <jailhouse-dev@googlegroups.com>; Sat, 30 May 2020 21:20:20 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH v2] driver: Account for changes in kernel 5.7
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <502d7249-3688-c122-7014-ed9c1f82d18b@web.de>
Date: Sat, 30 May 2020 21:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:qjZgQeYalhILLAT8bbmqfk82eHHxFMUyPXhhQJx3yPa3iJpWxWC
 p+2vBgAP6EwXWZFkzqaNMUPk51Nba1K8FkZI1+Kg4oyX1sZjehFNfg+28DgxJwjQ15guNHP
 lweL08MaDp4Ste4XmXjaGO60AuNBLVDqtCvqa8M9aMSBvZNj73o3B66FmcsGeu1nEiEV0Hr
 7dT5dRPdfAMlBU9XfN9nA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UPL7VBuTsJc=:Nt3lFFEHSsnhuLfJ3HaPBn
 D2N+4xFg+RO9znMNEuKTH6PuafdaTQuDmYYzT5vPqObFY095K+ZiMii5/J1EUxHA9cPU9qa/Z
 5znDD/eVk1tsCU3W8ekYf/x8An5X7ckDyfdHpHcDsW5xT+cypBpVy094haJ65SrnvLaX5mq++
 QqKPFe2KCGya9nOoSn+5712VDRJVGWFqhJu2iP+xnpDG5nj0iKh/hXLRkp/eE/A13x5cWgBMB
 MJAOmdTOl0MS+0hMXk8wCxB4hCOLHecF0E+VWp6CfXiDfhWZJGwqAZj3EX+JnjbcapCSx9Xjk
 Tu+497aP98c9dPhU2dpH0Qj5AnHrGt+8UtGGkTYNBuibWZbK1BL2O3iIgO2IPnrhh6HiGIeoB
 FwS7rku2pavcizlkKqBbjfBJwncGhTN0+o2Eu3UC5590BNhq8PRViJbXXEYrh+GH1sICGGtz7
 DjCxeG3n89XY//KbVJS1vYnYbrQoEv9fOyJWdl05Gh6iPl9pfNQbyBtHgwspIRQdJbfNF9hU3
 bkuXdsu35Zaz/bOPFOwC7JXb89/ZAwUIt91C/iveeme+OH5PmiMJE23aZoEdGN7Ksky7bZha1
 eDP0MMSBjaDHjf6XMC4tHRIbqFdwd0OE8y8t+WLYhoUx8U34ykBfDkvYrGYvfxAED58GZsBLO
 NjYyFsXOWkD3d5oLjTYxArUtFIUzRmIa9SgTte/A3KwGnhFLKjodHSsE4QqXksS4p+NgUelye
 KVhlk5nzA+Nx3dhZ59eu2jDNdep0gKOQ5OBbgmfa6I1SzVSI7uiP/sZdAapB2zOd0FWdEvt3h
 4+R9YLwVBOdbNE+vgYqr+gvdscuVKNV3kTKW7z+Y8PP0DScI05LbXanio0Mucl/9FRK7JUUQD
 LmdUDq8RyI6xjT9ogbQrDoBPms2hNAkBHqeczBMPlNnlq1+fySzdA+kwuGpyuLX2PRybcnnYO
 YfIA8drqe3v7R/s6VXTZALKSd2IdDHbZ0OuaYs3mCa+fKqj/UAc23goJw5ldRAtHg8wlSbq0T
 qdc18UPvBukL97Z45Rdt0JWdlYltOQwFI+0+VBAaQju84esQIYCNEuMjbqIlwYoy9hXcQqBG0
 NY/mTV9Yaj6h5LYNILl9jPhvs9HWePw4trKw+otIT3AhO4jHUcmRF0iZZf6qCyrsTJUp29VOz
 uScFDFP6riU29eDpF8DfJd5gESE9qtXb87CT8SZ00+EcoQwJI7HMXtexnlTRDUrhm00EAnbXv
 7ZabJS8BB8zaXXnHi
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=dKm6Qg8B;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

The cpu hotplug interface got reworked. Furthermore, our trick to avoid
kernel patching for EXPORT_SYMBOL purposes only is passing away with
kallsyms_lookup_name no longer being exported. Keep the infrastructure
for now for the sake of older kernels. We will remove it eventually.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Changes in v2:
 - build-breaking typos--

 driver/cell.c | 14 +++++++++++---
 driver/main.c |  2 +-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/driver/cell.c b/driver/cell.c
index 50e344e5..ade61edb 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -10,6 +10,9 @@
  * the COPYING file in the top-level directory.
  */

+/* For compatibility with older kernel versions */
+#include <linux/version.h>
+
 #include <linux/cpu.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
@@ -23,6 +26,11 @@

 #include <jailhouse/hypercall.h>

+#if LINUX_VERSION_CODE < KERNEL_VERSION(5,7,0)
+#define add_cpu(cpu)		cpu_up(cpu)
+#define remove_cpu(cpu)		cpu_down(cpu)
+#endif
+
 struct cell *root_cell;

 static LIST_HEAD(cells);
@@ -232,7 +240,7 @@ int jailhouse_cmd_cell_create(struct jailhouse_cell_create __user *arg)
 		}
 #endif
 		if (cpu_online(cpu)) {
-			err = cpu_down(cpu);
+			err = remove_cpu(cpu);
 			if (err)
 				goto error_cpu_online;
 			cpumask_set_cpu(cpu, &offlined_cpus);
@@ -261,7 +269,7 @@ kfree_config_out:

 error_cpu_online:
 	for_each_cpu(cpu, &cell->cpus_assigned) {
-		if (!cpu_online(cpu) && cpu_up(cpu) == 0)
+		if (!cpu_online(cpu) && add_cpu(cpu) == 0)
 			cpumask_clear_cpu(cpu, &offlined_cpus);
 		cpumask_set_cpu(cpu, &root_cell->cpus_assigned);
 	}
@@ -421,7 +429,7 @@ static int cell_destroy(struct cell *cell)

 	for_each_cpu(cpu, &cell->cpus_assigned) {
 		if (cpumask_test_cpu(cpu, &offlined_cpus)) {
-			if (cpu_up(cpu) != 0)
+			if (add_cpu(cpu) != 0)
 				pr_err("Jailhouse: failed to bring CPU %d "
 				       "back online\n", cpu);
 			cpumask_clear_cpu(cpu, &offlined_cpus);
diff --git a/driver/main.c b/driver/main.c
index 01e9c049..ec302639 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -900,7 +900,7 @@ static int __init jailhouse_init(void)
 {
 	int err;

-#ifdef CONFIG_KALLSYMS_ALL
+#if defined(CONFIG_KALLSYMS_ALL) && LINUX_VERSION_CODE < KERNEL_VERSION(5,7,0)
 #define __RESOLVE_EXTERNAL_SYMBOL(symbol)			\
 	symbol##_sym = (void *)kallsyms_lookup_name(#symbol);	\
 	if (!symbol##_sym)					\
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/502d7249-3688-c122-7014-ed9c1f82d18b%40web.de.
