Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQOVXH3AKGQEMJYIFRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8DD1E4396
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 15:27:29 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id y7sf11230783wrd.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 06:27:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590586049; cv=pass;
        d=google.com; s=arc-20160816;
        b=u0sHIV3r20xxV0WEzV8VPOxswbk1674XO5Uz4Z7mEsiW9s+V1RktDWTAPV1UeZyAUy
         lURxDvsbNQr+fdlGjmBaNPKMcY73MTFu67wIPuPznJoWQQYskFKruzFm/Xf60NJ6Fpg9
         B8FYBgEHcnhjXSEYfuILEp5OoVu+lQyQXIV5VoAV0/33il9Q0MWYZZEAfb+K0Y9fj5T7
         KftURJi1F4fGCvQSgH7nTubyipBpjVJyawKLQ4vbVMphc8ECqjd4LOmdVaqFlCOyXBrF
         ZKzi9wZ117OZXys0TDUnkRajFM0ZkUttoBv3cWCgZS+YInj1YRJA71rJvaJ0j+Soce7v
         iBcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=W06bSgzszDue3FZ3bVrjW0g9NnG+Rucm2HZXYUMw+pk=;
        b=magiAGDUZl/TEgFoWd1ZPEjlU2SCYJVOjWYIj6luQkZUR7jVFrdLReJyefrckZOHug
         C9EOpLorDc4E+JaEWjRqrTTOe/boxutl5ouk5rw/O5dAw8KEBaXCuX932QRAknEWZOiq
         HPNxTGPgQ2GuUaks1mHQ2hf7peUsUN9tFRXHEwR+gNExtOtyiJiqKYMGZLI6jep5LsXF
         0xebeDkKm4Ns152ExAYfI+1V5YbQ+23ypFZ3xP8B98/4Ogyzz5OkPNZDLPS8tqM7F0Ki
         Rbm0DCt4/moWALHK1/In4rxeituuJqVF0toZ9QwNXr3YttSsOmkjNtQxWrFl4vKr7Wdx
         nUOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=W06bSgzszDue3FZ3bVrjW0g9NnG+Rucm2HZXYUMw+pk=;
        b=osaQ9ElcfQm8zGlnIMKOSaJqlHra6vO9NjrQep8BksHvpPbeTjv0nfzvHma05w8NKA
         lucWx8oMCB1kh+wJT281c/szje/y1h+ozSGCJIMnfgqgZ0tbo9V3wun+SbxZDYvAg3dJ
         BHWX9ukj3RSSLlQbbKicxhgR6JIyIQp4m1LfarwFwgiV8Pz7kxIE3W54PANibanXN9aH
         kSGb3PZD7WiQJpmnGylfSJ5xYeAVkpI3Mv3VWelQ5SrkAR1bwHsgw18epNPC/mur70d1
         Cs3t8j7+HIROEP310/zjnSjo5E8JSgjjdRpZMFT6p1cevW7WMdPOW4mcNw2kwb6sThdS
         oT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=W06bSgzszDue3FZ3bVrjW0g9NnG+Rucm2HZXYUMw+pk=;
        b=T2HGLRwMA/XLYwJTI4MdzuDdmHjkGc37h02mEykxhRfhjxI/HZgymn9eLCQlIGNJOo
         KwexjzBOsio5DLFgXCw8lmYkNBqjjIEmeHHG5h1luzzLJNmwSmQJzCKfF73VWAd0qLVJ
         dM+N+LZmJYUksxlAMWI4gUaYMQb7qP/gp4qNrufY8f86jQMVPIGsnBYhtgD9PZNJ7zfF
         jzcrvorygWLU/iUwBQPwHthxnRd3Wi9aFkiB1Nsebs3FB55R6VWR68240TrW/SfzUyJP
         l1BZgGYuMf0fHMOBfyveXybsI8DSVev0MXY6BcQf3Sljs1b2KGE9v7InqGhKrI0w58Rw
         kKAw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Gzwp0WfRVfKOIcox3YNNTuOFHaCr7ODsLe0tZT0IpQf6aDBTp
	Ki34JL4WiUI8h5hoc55AjRA=
X-Google-Smtp-Source: ABdhPJwRpT40+udArpk8JPv9stirvZ0dgFcI0fG4zb5s8zsumHGTI6rvFSHHqpkU57vZb/arIMsCjw==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr4557249wmj.185.1590586049240;
        Wed, 27 May 2020 06:27:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:62d6:: with SMTP id w205ls1526095wmb.1.canary-gmail;
 Wed, 27 May 2020 06:27:28 -0700 (PDT)
X-Received: by 2002:a1c:32c5:: with SMTP id y188mr4759704wmy.16.1590586048399;
        Wed, 27 May 2020 06:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590586048; cv=none;
        d=google.com; s=arc-20160816;
        b=JwWh2I1on2wR2m3DJrbJg9M7E2rDhGOSyb0juJk4G8xtloqURVmdmNqZZm5H5lhuhj
         /yiRg0IR9TvxnmY+oIYBuv3JASwG/EhlwnztPOzm4/0WGaVEbpwP+gk75LMniw8p2ZNE
         1dSSD7UgoZvc/jR0eCtfOi1OnNdPtpV3b6GGBD7j3Pplhqyi3jn4fQ56e7ZYe0E8YMnZ
         2fNvjKNCBf+03ah5wiHTH40Y7sHgR9xS09A4nQZO61jLbN2zoRK7K/4MeNHaJN0LDJ05
         YXuuaBUm8INh1pY7d2jUDBwQdclKiAeExphCHWL06I5qBpF6MkNdTLifrmqeHUwtaW1s
         BsNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=BD/S7O7dWpGqO5Ono6yuIGvugJZ4OeKNj10G3RuTnOI=;
        b=X42zROSPDAqT0uDsqheywlMSJb4lhAZxsCiYOti4x3sAqFp+GFPXAwAMuHkgykQUAW
         NkPtemMNWEBupUw+hH04R1dRMBCcfNbaoJMeRFNy0/mExRTUR0L+7hOrDACAJZtRBwFF
         8MkrqFMBNV6xSlC48kPJejc5XoRkYw0GWAWKTbsG+csXOQUStXPB9UYA+i46MH3Z93uw
         YDuSkaKN51EEJyq2EpK30Bxo0F2SPOwTk452eQUtZRCyXJyaV4QhcSBtPxR82rccWGIS
         RJFdjTpi7QJMzqW/eM/MUNRC9QsAz6mOD9+Bfp0m87Y/NjBfRYrNZ71Tloi23+IKJPnz
         ei+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id m20si125646wmc.0.2020.05.27.06.27.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 06:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 04RDRSjE002519
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 15:27:28 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04RDRRK4001470;
	Wed, 27 May 2020 15:27:27 +0200
Subject: Re: [PATCH v1 3/4] tools: ivshmem-demo: Map memory regions with
 correct sizes
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-4-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4063dea0-f02c-db59-dda2-1212e49bc6e2@siemens.com>
Date: Wed, 27 May 2020 15:27:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527123225.31726-4-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 27.05.20 14:32, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> ivshmem protocol does not describe a fixed size for the
> rw, input and output regions. For each platform, the uio
> driver will populate this information in the sysfw.
> 
> Extract the size from sysfs maps entries and use it for
> mapping different regions.
> This will make the demo generic such that it will work on
> all platforms with different sizes for ivshmem.

The original plan was to keep the demos simple, thus these hard-codings
of the normally used page size. I'm fine with getpagesize but I'm not
sure yet if it's worth the also read back the region size because we do
not use that feature in the demos.

In any case, please align all demo implementations then.

Jan

> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  tools/ivshmem-demo.c | 50 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 41 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
> index 8201ad15..163653e1 100644
> --- a/tools/ivshmem-demo.c
> +++ b/tools/ivshmem-demo.c
> @@ -17,6 +17,7 @@
>  #include <signal.h>
>  #include <stdio.h>
>  #include <stdint.h>
> +#include <stdlib.h>
>  #include <string.h>
>  #include <unistd.h>
>  #include <sys/mman.h>
> @@ -44,6 +45,25 @@ static inline void mmio_write32(void *address, uint32_t value)
>          *(volatile uint32_t *)address = value;
>  }
>  
> +static int uio_read_mem_size(char *devpath, int idx)
> +{
> +	char sysfs_path[64];
> +	char output[20] = "";
> +	int fd, ret, size;
> +
> +	snprintf(sysfs_path, sizeof(sysfs_path),
> +		 "/sys/class/uio/%s/maps/map%d/size",
> +		 basename(devpath), idx);
> +	fd = open(sysfs_path, O_RDONLY);
> +	if (fd < 0)
> +		return fd;
> +	ret = read(fd, output, sizeof(output));
> +	if (ret < 0)
> +		return ret;
> +	sscanf(output, "0x%x", &size);
> +	return size;
> +}
> +
>  static void print_shmem(void)
>  {
>  	printf("state[0] = %d\n", state[0]);
> @@ -67,7 +87,9 @@ int main(int argc, char *argv[])
>  	sigset_t sigset;
>  	char *path;
>  	int has_msix;
> -	int ret;
> +	int ret, size, offset, pgsize;
> +
> +	pgsize = getpagesize();
>  
>  	if (argc < 2)
>  		path = strdup("/dev/uio0");
> @@ -82,29 +104,39 @@ int main(int argc, char *argv[])
>  		 "/sys/class/uio/%s/device/msi_irqs", basename(path));
>  	has_msix = access(sysfs_path, R_OK) == 0;
>  
> -	regs = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED,
> -		    fds[0].fd, 0);
> +	offset = 0;
> +	size = uio_read_mem_size(path, 0);
> +	regs = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
> +		    fds[0].fd, offset);
>  	if (regs == MAP_FAILED)
>  		error(1, errno, "mmap(regs)");
>  
>  	id = mmio_read32(&regs->id);
>  	printf("ID = %d\n", id);
>  
> -	state = mmap(NULL, 4096, PROT_READ, MAP_SHARED, fds[0].fd, 4096 * 1);
> +	offset += pgsize;
> +	size = uio_read_mem_size(path, 1);
> +	state = mmap(NULL, size, PROT_READ, MAP_SHARED, fds[0].fd, offset);
>  	if (state == MAP_FAILED)
>  		error(1, errno, "mmap(state)");
>  
> -	rw = mmap(NULL, 4096 * 9, PROT_READ | PROT_WRITE, MAP_SHARED,
> -		  fds[0].fd, 4096 * 2);
> +	offset += pgsize;
> +	size = uio_read_mem_size(path, 2);
> +	rw = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
> +		  fds[0].fd, offset);
>  	if (rw == MAP_FAILED)
>  		error(1, errno, "mmap(rw)");
>  
> -	in = mmap(NULL, 4096 * 6, PROT_READ, MAP_SHARED, fds[0].fd, 4096 * 3);
> +	offset += pgsize;
> +	size = uio_read_mem_size(path, 3);
> +	in = mmap(NULL, size, PROT_READ, MAP_SHARED, fds[0].fd, offset);
>  	if (in == MAP_FAILED)
>  		error(1, errno, "mmap(in)");
>  
> -	out = mmap(NULL, 4096 * 2, PROT_READ | PROT_WRITE, MAP_SHARED,
> -		   fds[0].fd, 4096 * 4);
> +	offset += pgsize;
> +	size = uio_read_mem_size(path, 4);
> +	out = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
> +		   fds[0].fd, offset);
>  	if (out == MAP_FAILED)
>  		error(1, errno, "mmap(out)");
>  
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4063dea0-f02c-db59-dda2-1212e49bc6e2%40siemens.com.
