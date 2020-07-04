Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5MVQP4AKGQE7KKH75A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 560732147ED
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jul 2020 20:31:18 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id g6sf34363224wmk.4
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jul 2020 11:31:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593887478; cv=pass;
        d=google.com; s=arc-20160816;
        b=O9GLCugE9wA3rJwoRCiBaINw4G+QCj/vOI9NHhw7Y8o3I/6D43EQstPB59EsZqQI9N
         OsNCBil0HUa/wBFL0irBMVZepyxloUPl+KvwKQcl3uFWhiMBM1n6uLTzO7cvbfu9LiM/
         i0LBsphPY80HzhZrYX0tfZ53fByPtFb5iIPt+qkXmvaMMl3MPlBr4xzFqkGaZrL9mcT+
         je6SgW7laFy3kEKMDff16pK3fvR5+SrqXAGOInhVXtRiggVO4mXmM8ZWSt6lVDUM1Uci
         yDdC2BNG+hRaNld0koIQilYXEGDGN+JDbUaW2wtJlWJU/pmq5DzRiFDyU38lQN1s+NNx
         iZ/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Eo0UUAyDtMoLxkxRV+coNG6hBCGT/MZ9Ap2nmB4DuJk=;
        b=pDUP+Tn3ezLeuYv3L0GsR7Gv/avqrnK/DoDPy4+OGupcF8CG8fq05pNy393qf6wVkB
         S2HU7btB7P5EGcunV8+V/1u5knYcB7BDR1QVznyGecfqYkWRbHO2uGUzn3IsrCNbeHsl
         FpFxGOnqMdtTr/fHleCZwprgzIkVE8HqDjYZ8IZ7PBGsqur+cUZmdYJpuEmKu1CdTt8C
         A6NptJ9xs3sGznYHiKbEy41W1zRPTngqnIpurun2GqPhSrtF9xm29zaSDRqaxYgFtZAv
         zzvhPle3R8nLUtHexkHTDVfgerWBN1mp5But3ec5beFyQ1CvoFjvULKvNnTQNLLHC4hk
         +GYg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cuY4CMoQ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Eo0UUAyDtMoLxkxRV+coNG6hBCGT/MZ9Ap2nmB4DuJk=;
        b=eA2JdUNrNs+uU6/ekPM8/ltj60DhUbSCQAYxBA5NsSK7Yf/x5J09w7rxx0oEfTgxDU
         qMcN9QxyoLBVLNuY+Q81R1mo48IZc8vZmvtMA2P3d/T9inZRO7r+GUFTkC9/3CgYPtCC
         ryQBE4wig57RkKCam2ymvKPa5izTHiI49JznIZTaW+X6D4hH+E7o3cKXiCEC810zTfhW
         oiwUm19pfDq6aXummHmiVKZTcit680xDhaSpa3pWoyaW8tEhMAAFmtsqEDlURROw5SdL
         p1ta8U+3KF5fftwph7i9BxmJMifxpdrlkC/on23t4v6QDzKvKteJ37KePMfLxXGb07L7
         nqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Eo0UUAyDtMoLxkxRV+coNG6hBCGT/MZ9Ap2nmB4DuJk=;
        b=OTFf/CrXohP+PGAHw1hANX8QpB71TNAmETcJsPn22men5nRXtcCemmbKOPm68TqRrv
         Y7klGc4N1lofmbyP0JjjP3fvEMSh6yCKnmquTJbWB/Co7kBpAE/DGIjF7bXgTygOKgfE
         97peMLb7Gn9gompfTJxybDjB7I+y/M5h332ZtuSUAB02F09eqS0F9eBFzwRUkZ0eLLbU
         YD4SUlT31F/cYy5YRBXh1UPQrtiasKVWVnhe94ycDV8nmG79/L0GiCK7zwRlOTPmdQkE
         l0FaCSZLh7k2b341luZWFHlFowgub2dV1iL45G301lkzZYbjjd1M0Eo9hoDlaePKTUcg
         nIJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532NkEUWDLtLVIrQqJ/cK+q2KocB0I2bwDV+d40B1L+icv9kyo/i
	dWNraXXufi2sRt1LRd8TN3Q=
X-Google-Smtp-Source: ABdhPJwPBjXt5GqTKXMh4VdVavXwuQ7vH4k6I4ZaL3Tv0Y+LORVo5sZAnaNZ2s3HjbDKH8qiEvtlYg==
X-Received: by 2002:a5d:6809:: with SMTP id w9mr44619117wru.182.1593887478089;
        Sat, 04 Jul 2020 11:31:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7311:: with SMTP id d17ls6177902wmb.0.canary-gmail; Sat,
 04 Jul 2020 11:31:17 -0700 (PDT)
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr44021668wmj.39.1593887477430;
        Sat, 04 Jul 2020 11:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593887477; cv=none;
        d=google.com; s=arc-20160816;
        b=ZecvPuql27RrqqoxGBSkLYCp/6GN7/xCrQxO9vLl/LKUCb65x1nMcD7rupHJ0Rv92l
         j5h+q+kzqtN1rhxq3UPN6yULLFPJ9PgNmAFwZVwX3s0KPyfSosK49hrysB7NMhaFP+KU
         2ujR2Sjvgoljp8t4IAhbqfxOZrpz5tbYyc10BFDVi9O21iJ8EB9NezfskoatPBD+GFGs
         F51nU2WoQaGbnS+1HlVdMlslZQEakBAjsUw/Yxx15sRE78pVq0NWlbdXrm8Z1ZhD5PVg
         ovTGL+PsFGt2iVpE1yxgMX/434Jn9SdwQmQMSgz8PSlxHky0LBHdsbl7fGVAzvuvAJH+
         WEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=1xxns9a4TtesYPqiBfQ9g2O6SExK6EU4BUt7+LrBND8=;
        b=wbjLE1JWJUaZRB1lKUbdnbEHlzb4zcoI8/23Tu69w85NV7M09n5XRhqmO1RR/Ge5Of
         bh/wYUbsYP0F5gLdRxGfWRDAFf5l6m1C+jOPPlCPp+4nKG4IoTjLAM7P0wHTltyhxFkJ
         nFYQ5niBwqBQtDUYcF9tblUt4fF2z1ZIfy5ovmy/kdCSwvsy9ZDImO1LbJ0ecs3nu1aY
         ZTYz2xWWuqyzGPL00fZo003llLknA0Hnz83Co5Km4Kp8EZiu7Hyzn52iugDReCh/aanq
         pPXMl2Eckn5G946cbGXqqRz57b2WPE52pxr1HZClGemBdMrJ9Z4PhoaSk5FDA0EVi+10
         KTIA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cuY4CMoQ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id l4si618967wrm.3.2020.07.04.11.31.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 11:31:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.11.10] ([95.157.53.180]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MSs2H-1kJX3h3O4b-00RthF; Sat, 04
 Jul 2020 20:31:16 +0200
Subject: [PATCH v4 6/9] tools: ivshmem-demo: Map memory regions with correct
 sizes
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200611125423.16770-1-nikhil.nd@ti.com>
 <20200611125423.16770-7-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <58b205d4-e873-a0ca-d7f7-1b69a5e2f377@web.de>
Date: Sat, 4 Jul 2020 20:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200611125423.16770-7-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:OQ63PviRNAQiMygTfJD96X/eEi+ZE4dgaX3FEZaVxOXFKnb1OA0
 G+UFIaj0D3Fz5hcr22zXnRe1kOLZfzDuGPjLPAPd2NDZojZFNWCop9JUkeJ7Lgtsct6tTb9
 lwYnUew0h1gB1fQZX8KIC63rw2P0vjSlSvY4DFvEiSzFcboMVVBzpUVptPnqV4uj2W5Bv4e
 S/3XvvYxRDAUOEYbM/Nbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JQ5FTFNdTT4=:wQE7bUsRvYIO2OtV1WsKNw
 EnB9M2sh8MMefKlpGpS+J0yLxtKxgkvzfPfuc9o/yfb6pqTk3lGZWU158NWxQ3lj0Gs4LG0iG
 lpLPmJGpuSdYe6mFnozwIyfA3zlAqfiNXW1XKzEfMDA7TeGayvRf2E8Kj+Dnt/DT2BYloRyBa
 kcLGzOFa5ZUWX9kG6EvtMjJdEYkVtZ1tfKUc3xKRe5qF8MbEAgvCREB45S2w4qf7HVXmBjL4v
 ovbpkrOmnETLfQ4zkjaRTw2KfkUhvirUH1Y+e7H4qp+RwUg34w+VG3irVS0Xc2kccgjtYjCXt
 aPjxokIr9cRbW2ckM5qufQgt+L+JsNcHXSqi+FjDAKfaVsIvSQ2LIJi+SRkuVyTbqgFxLCrCk
 B1uBKj1ZcWFCc9ppWmGOloCivCzueTlRvJ93zHx98rZie/UG2W1qcvgtU4szHokP3QT2ujDPH
 R4k2tuxWe1Fn9Z6EWbWcXNbUsHGUalE+DSiYZJytDl6lfB5UL2fxVz9t/nrFKJsT+3kHFrQkD
 rSz8W20qNXyeeb4Gu0iPjwwH+fGnefzf2voiMgfSGA/ZMjQENUeHSA4kjwQq013HKkppr7omI
 Cz54coabCsAkdFgC9eO5jOwWy9zaXx/lGJgzCmQvx+6iu2Rih7doCD6cenHL6OjMQBJLBMOSu
 IjPDKyr5Snrz/TY0AaJ4kx+mg9p709jmHhga3TzCctHG+q7HiXssgTNxOAqZaOZTnlnwuUImr
 FeEDWXwO5cNw+X7lq9iCIiNIQF2sGoncMeDFTkeWXTYFqazIzrB92LK26zjDKnNIImHEs1jGk
 9/jQAP6+nwPqqNo6s5pmhpRi4HA9Juh8dHhYx2Y/OHeK0ask7fIR8rSAGuLhCUFGQcO/1m4HA
 zla4UdBrZlPh1ir+ZzZEARSkrsdXZN4d/URLq9e8THjvrAOETKP1wncnOwk3wLgndoZALlBr5
 G1D/t3kj+Qq6cWxeMgPNPGH0ackykInM2Y8LmqI+JF0OiyM6rZXqdTZYSBOvyK0v1f2o5azBv
 ceqKNtl6MAy6JuUwkeOIZjiTLPTx3zHFeZjgs8DZPsPMRLxvlAxa2bMj1ceThVSBJbaVFu8K4
 QslEQKJz28uSyj0Sb6EpDvBFhvszcwkrJ9Xb094aQ62mWhAiqI7e3dfOxWIou45LKjUDvN1ZB
 bcnBuAEH8BBV2OjMdfG+orh4O7M1PWDa1ObcVQXoRHCxR6g2updliniCQ5vuUdNGY+/y4QpOL
 6SHOVS0n2d+eB6kTo
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=cuY4CMoQ;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

ivshmem protocol does not describe a fixed size for the
rw, input and output regions. For each platform, the uio
driver will populate this information in the sysfs.

Extract the size from sysfs maps entries and use it for
mapping different regions.
This will make the demo generic such that it will work on
all platforms with different sizes for ivshmem.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: terminate on error in of uio_read_mem_size, fix return type,
      process sscanf errors, close fd]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/ivshmem-demo.c | 53 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
index 8201ad15..b8d73e4f 100644
--- a/tools/ivshmem-demo.c
+++ b/tools/ivshmem-demo.c
@@ -17,6 +17,7 @@
 #include <signal.h>
 #include <stdio.h>
 #include <stdint.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include <sys/mman.h>
@@ -44,6 +45,28 @@ static inline void mmio_write32(void *address, uint32_t value)
         *(volatile uint32_t *)address = value;
 }

+static size_t uio_read_mem_size(char *devpath, int idx)
+{
+	char sysfs_path[64];
+	char output[20] = "";
+	size_t size;
+	int fd, ret;
+
+	snprintf(sysfs_path, sizeof(sysfs_path),
+		 "/sys/class/uio/%s/maps/map%d/size",
+		 basename(devpath), idx);
+	fd = open(sysfs_path, O_RDONLY);
+	if (fd < 0)
+		error(1, errno, "open(sysfs)");
+	ret = read(fd, output, sizeof(output));
+	if (ret < 0)
+		error(1, errno, "read(sysfs)");
+	close(fd);
+	if (sscanf(output, "0x%zx", &size) != 1)
+		error(1, EINVAL, "sscanf(sysfs)");
+	return size;
+}
+
 static void print_shmem(void)
 {
 	printf("state[0] = %d\n", state[0]);
@@ -67,7 +90,9 @@ int main(int argc, char *argv[])
 	sigset_t sigset;
 	char *path;
 	int has_msix;
-	int ret;
+	int ret, size, offset, pgsize;
+
+	pgsize = getpagesize();

 	if (argc < 2)
 		path = strdup("/dev/uio0");
@@ -82,29 +107,39 @@ int main(int argc, char *argv[])
 		 "/sys/class/uio/%s/device/msi_irqs", basename(path));
 	has_msix = access(sysfs_path, R_OK) == 0;

-	regs = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED,
-		    fds[0].fd, 0);
+	offset = 0;
+	size = uio_read_mem_size(path, 0);
+	regs = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
+		    fds[0].fd, offset);
 	if (regs == MAP_FAILED)
 		error(1, errno, "mmap(regs)");

 	id = mmio_read32(&regs->id);
 	printf("ID = %d\n", id);

-	state = mmap(NULL, 4096, PROT_READ, MAP_SHARED, fds[0].fd, 4096 * 1);
+	offset += pgsize;
+	size = uio_read_mem_size(path, 1);
+	state = mmap(NULL, size, PROT_READ, MAP_SHARED, fds[0].fd, offset);
 	if (state == MAP_FAILED)
 		error(1, errno, "mmap(state)");

-	rw = mmap(NULL, 4096 * 9, PROT_READ | PROT_WRITE, MAP_SHARED,
-		  fds[0].fd, 4096 * 2);
+	offset += pgsize;
+	size = uio_read_mem_size(path, 2);
+	rw = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
+		  fds[0].fd, offset);
 	if (rw == MAP_FAILED)
 		error(1, errno, "mmap(rw)");

-	in = mmap(NULL, 4096 * 6, PROT_READ, MAP_SHARED, fds[0].fd, 4096 * 3);
+	offset += pgsize;
+	size = uio_read_mem_size(path, 3);
+	in = mmap(NULL, size, PROT_READ, MAP_SHARED, fds[0].fd, offset);
 	if (in == MAP_FAILED)
 		error(1, errno, "mmap(in)");

-	out = mmap(NULL, 4096 * 2, PROT_READ | PROT_WRITE, MAP_SHARED,
-		   fds[0].fd, 4096 * 4);
+	offset += pgsize;
+	size = uio_read_mem_size(path, 4);
+	out = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
+		   fds[0].fd, offset);
 	if (out == MAP_FAILED)
 		error(1, errno, "mmap(out)");

--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/58b205d4-e873-a0ca-d7f7-1b69a5e2f377%40web.de.
