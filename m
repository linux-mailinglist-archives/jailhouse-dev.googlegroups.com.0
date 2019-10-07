Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHGD5XWAKGQEJCDF3HA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id AF03ECE887
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:02:36 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id n14sf9325418edt.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:02:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570464156; cv=pass;
        d=google.com; s=arc-20160816;
        b=0s9pQ/dqsEAk312NcLER4FiGZ573B4SEjhzGNFq4F/EOMaUP1A+MJGt5oCtB0DXMgO
         itA3fyBnDEPJxPwGLJ5f4h9nNEjkPdbuIRNGOx52+ASfkGDlWSnke2iieMH/ZL0dAY3v
         VzH/IB8xpTRmuFE9YaH/fXvw3S3FdLWsHPbvtumvEeOS0gx4Y6/2q6yWQ/2hlkYM2/8s
         6vuY7rvjPQBCVlSZ9f7pUlhJX5AQcFqesv55BcGFSZ9xeulQoJkni39zzWZMslPLvMfV
         Nnvl5u6jYd65/4kdSmbKOIDBYxI917h/rMmb7reV3FupG0fJOY+OKbGYO3ErZs9B4y+i
         PF7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=PTPwHvw7i7KMLCQVCCIq0SC+l6nBmMYGic6i9QFPk/M=;
        b=e6k4llXrXEMndx1B6GxX41tQuaFipPrv5zQSxJieXLJ988AKNc/8v5J03p0dTy5qQQ
         LYxie2l9+N1SBFQf1kkxSxqTPmYi97QYJhnfq8lHnL3vLoygxXPN3xyRm5xf8/Lfv7ch
         3ph4X4qLhDomoYIKKNvMNciNbAtnjLrNizo0q3QFBQKNiy8nYNdo3u4FqoUl0S2Fdl/c
         WYZ39P2FQaIWzcF48lNYTKB/xVPXMzC/TbYGut2qIAx9m6+n3uCn43t8wmhYmlv3hcOg
         xwECmU98h6dcJYe9hDh6scE0Xie7SeuqUmbMNWPVmMrEZhP5ObFwl4YfBCrqFuVCDU+Z
         LDOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PTPwHvw7i7KMLCQVCCIq0SC+l6nBmMYGic6i9QFPk/M=;
        b=onL/3D4P1OzWnFsN2lfEjtr6k2p9sAV7Hde/LGUke4OsFwRECwVYMEX5eKF3IrRvUS
         ponlBPHq5UxCzibhpayvenOYOaRc9mA/DX9ZF8v1prRyESmCUca5n2xsLEQUWt3bRa6x
         llVkyXnBByEvOEoNke3W/nwyTXLijmzRFhv3M8hRJ2GI2AXzl1z68TbcWEYuxsDzZjb2
         azoPHWORQim+75IYGoFvBF15Yf5AQWB6ImPneFG/uFVw6hdPLHipTmQDe00g6EEIX+/c
         qvA7kT4KSAH7ezMG0kecHpB6fhnM1b45trSIEb66Sig+pj7G4qRfWRvobGczdgmWgpPh
         jqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PTPwHvw7i7KMLCQVCCIq0SC+l6nBmMYGic6i9QFPk/M=;
        b=c8QgS2T+tIljmSup/b/FGmBD5T0js0ntVOOxNEhU9DkjVyJePztzeT6g5oIwm1g7SQ
         mMa+s9AmsNT7x98opx4pmsbsmbOKJDjZ7MFZ9CH0gHPC1lyYCCyNyfH2Y1ewEYHk5djR
         bMSiCpdNmlWBdpOl9aIwlCH2lLfQi26Xq1ZpjW/kuxhcL9RgC1eC3ujvCwFvLVMZexgC
         wVW3zB91XUoAuJjtlFpVf4vUavKmC+buCwbKL4JJ43SmUdwXIb8fSciIQein42JrNrNY
         gajXQgXd9qSQaqVAFE63MFj3HnK5e8t0wK4vBEbU7mtwLbz7M0pfQ3s00DYF/ZqmhW1e
         4deQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXq4XWT1LU1t5QQbl1Y3Tx5TUPjRjXQ1n+SnTtGXuppS6BodkxO
	tVxccae+tAzj67K6MltYKNk=
X-Google-Smtp-Source: APXvYqziW5Q4ztr65NPwzrbEgfjdQkA2RX8bQ/8esaPOpXAN3UqRI1UR8uTthdumCuo+wr3Qdwbo5Q==
X-Received: by 2002:aa7:d816:: with SMTP id v22mr17469912edq.28.1570464156356;
        Mon, 07 Oct 2019 09:02:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d144:: with SMTP id br4ls107885ejb.11.gmail; Mon, 07
 Oct 2019 09:02:35 -0700 (PDT)
X-Received: by 2002:a17:907:2126:: with SMTP id qo6mr25010148ejb.256.1570464155697;
        Mon, 07 Oct 2019 09:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570464155; cv=none;
        d=google.com; s=arc-20160816;
        b=BoPVhO7t14XxTa2n9DMSrMRS6W+G74QS7rBdEvD26s6hcZkxTDNXG88j24k4tbuThI
         97B30ITmm3V09y6ct8zlLFB1rWD+hwcQlprHLyU0TQnwHima4Uvl7f/gunL2hZBTcN/A
         W7kq9w+ZMxMt9mXenha6okSLi9XBOrjl0Zl9o7gYdUr4Chb1am6dKuLvLvK3R55OCv9l
         iCMjMZSXH1wQLGxI0XhoZlVh+dNUgf3u7faVS65zQQl+YB9+EZMjzIadIdtnRY7O0Pfo
         8x0zyjZUyX+4koBKxRQ5TBesZ/laUem4xy3WrdKutCvuwuVnvfx0DDDNnQCjH4gUks7L
         Iu5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=FcaqSTbH0FnKMTtppsoGKimf125nQWhjW3TL/wwBi3U=;
        b=AgClBMFUd7uVO1iEMGDi69olX/Ygvwt4BfzDSZk2ZdqQfYnKka4qsPwYN0vUhAxDQU
         nFsCJuFin+qXvEndIV0R4EeaOAHQysCUXt+82Iy3lLKGK+xPxqj+4HsqxycLMrQs0lyK
         pYj6OUMXowj9bUSNlHWpE8MHnKf6tRtI461LqegYHR7pIZGsIAeSKJS4kdoZmGfVpTfc
         2U7IcUFqZTOfFCELq77wXfvLT5s4wwMQSoHqllxJ94G05KDTB90zTzgjuur4Mubrv56j
         Qhxp2VTmuAzi6LDCcGWqLVa4d4FNVQnk4Ju3zqtZ92sldRYx+O8OY7UJGwXFsTPZRz5q
         1Ggg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id q8si1468610edn.5.2019.10.07.09.02.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x97G2Zxd022543
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 18:02:35 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97G2Zfj002920;
	Mon, 7 Oct 2019 18:02:35 +0200
Subject: Re: [PATCH v3 02/14] tools: jailhoues-cell-linux: cosmetic fixup
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, ralf.ramsauer@othr.de,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-3-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4618edb9-d37e-8be9-f09b-d7d6acdaeda7@siemens.com>
Date: Mon, 7 Oct 2019 18:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930191323.32266-3-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 30.09.19 21:13, Andrej Utz wrote:
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> Just for the sake of consistency: s/memregion/mem_region/. This is the only
> spot where we still had memregion instead of mem_region.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  tools/jailhouse-cell-linux | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
> index e43f8e42..007a5c46 100755
> --- a/tools/jailhouse-cell-linux
> +++ b/tools/jailhouse-cell-linux
> @@ -603,15 +603,15 @@ class Config:
>              exit(1)
>          self.name = str(name.decode())
>  
> -        memregion_offs = struct.calcsize(Config._HEADER_FORMAT) + \
> +        mem_region_offs = struct.calcsize(Config._HEADER_FORMAT) + \
>              self.cpu_set_size
>          self.memory_regions = []
>          for n in range(self.num_memory_regions):
>              self.memory_regions.append(
> -                MemoryRegion(self.data[memregion_offs:]))
> -            memregion_offs += MemoryRegion.SIZE
> +                MemoryRegion(self.data[mem_region_offs:]))
> +            mem_region_offs += MemoryRegion.SIZE
>  
> -        irqchip_offs = memregion_offs + \
> +        irqchip_offs = mem_region_offs + \
>              self.num_cache_regions * CacheRegion.SIZE
>          self.irqchips = []
>          for n in range(self.num_irqchips):
> 

Applied to next already.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4618edb9-d37e-8be9-f09b-d7d6acdaeda7%40siemens.com.
