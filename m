Return-Path: <jailhouse-dev+bncBDLOLYFISUCRBFUK7P2AKGQEYA5DW3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA001B238E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 12:04:06 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id n17sf352064wmi.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 03:04:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587463446; cv=pass;
        d=google.com; s=arc-20160816;
        b=fvLvaMpdHMdhiBrG1VaLWI64y1iqmYLXapsLoTs8BhC50HM7XTJ+7YO7HZUPuzH09l
         uxkZKd4qWpguqD4hxBGWIOMGMrfiA5aK83YrzCWyD/A5cm8rpIAW7YFNrUlapvYIT9V/
         iIjQcRIjixegeYfAhls12eaD3qixePAWbdzxuR+uem47xEUuytguJVEI2r428tqny2iU
         zsXNXgxjPKmywlI9j+TY205QVphPC0yjKH8CNl+fc1Rxx5T/TpYn9cGBA/LmYc6hwzpk
         zJEm6UpCZpG3RL4PsUd0ebTp4SdRios1VAvegizZLpgMMoxRZTiUGI4gnaOixef9JcMK
         hG2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=bZ0E0iBvznxIPVjefAk3/dMm4Pg3tglQJoyoqS1fZ+M=;
        b=xkneeIWDxcjTa9TSqGEXf+QdwJCmLWpNlIDBfqFuuY/uxfzwDZcuV0FdiRXuo31GKd
         gCqIAu4Yf5vrUZUAss+GAOLmoQQ88PMwuhnkP1YVvsj2O3eyCGaJEBgQ+GGoiCKBE7g0
         CfzYr01SSxNcpWWOXZUuPH1GnyAdAdNPF/GKo+KPkv9de2MVL9PCFrNE8Lt+i5nffm8W
         yznVlmE0eJOOkM95r2ftGL1SKzbpHY5tI6baFQwjYxqR0D8rhVeb+PB5M04A/duYuWDw
         xZ+G0U3LufCdcD0l3OZuEPY82QvIkyn7wv4kTgaihmlV9nRXV0tmOS/fEBfUMjTzeY8G
         a+IQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=0gv03p31;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bZ0E0iBvznxIPVjefAk3/dMm4Pg3tglQJoyoqS1fZ+M=;
        b=FfdPCzwMCwBszwMiKT1SO7IXELJd46uxPeIhsMvhpAG57I0iC3lpC7zYElnPDM/pp6
         GGRWstm/b79YTOT4ZveuXiLr4HIT9mtZ22WdwowQAW3q6SFXDwLX1zD4ABkTcdryUlyA
         n5AJN4rdWXyqqZeKkeI+/bRZM6sdiY3QFLXeCKGoySHKCXSfylybKnRT3JaN6ownX5eX
         Ob2Hno3pXhDeAd+X8qOrWOaxt8jBhJPqGDSuELSdtYuyhdooVu8Hc44wlcZDR7Wf3bly
         W4iS6FQXI+YU+Pjoyz7baBJo9Nsfir6yxvygx2rOQIqX2WVYb7QX0/jkwaMJM171LMB7
         PRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bZ0E0iBvznxIPVjefAk3/dMm4Pg3tglQJoyoqS1fZ+M=;
        b=Cx60GS8TtDCF6MF/RdJddSHZhMFAZSgP6rkMkYV4vVdZ1VWTY2vOH8A2/pQh3q44hi
         2ORviFwhievmtnOahdFlvAB74DHp0YOopP775d/5BMWnDCh+6jxQtSxRYJ+01CuhyWCM
         EFTDW2ksrFbRyQCAGQDO5jup2fOCz9FQPJ5pQqXhwtwsMIjccOzt+mzTdp1ELA6eWpdX
         H6e7QcH9yb1zJP9OXCILI/8/hLoYjdcxnKjOtU1Uh0COvBCErK0/+gQl4pRu2djguliF
         +TOvlNNETZMrID8q/KIvqgueAkLZVUuVba/UuI17ROtrdC/tNzfz/KR13BXO5ZcPXk5k
         nbwQ==
X-Gm-Message-State: AGi0PuZDXhFLFTloQ0uUBsItsfObNcL4Z/E0EhCUyo6WKEpk6lBFRDeX
	A3W91fH5NIsHrW6Th5lCjqk=
X-Google-Smtp-Source: APiQypIzMGjiNo73AanzDfRpJGSxlrw1kjOTzCmIRm00KNaPkFFBnWXNC5iKQCX8lf5KcMAtsmEZQg==
X-Received: by 2002:a5d:6647:: with SMTP id f7mr24803492wrw.41.1587463446410;
        Tue, 21 Apr 2020 03:04:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7d12:: with SMTP id y18ls3984364wmc.2.gmail; Tue, 21 Apr
 2020 03:04:05 -0700 (PDT)
X-Received: by 2002:a05:600c:2c53:: with SMTP id r19mr4378983wmg.40.1587463445774;
        Tue, 21 Apr 2020 03:04:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587463445; cv=none;
        d=google.com; s=arc-20160816;
        b=SVjAEMwmkYvjXDuI6k7CI/KmdqtEqqtFlMMBYv/wHlSQeoZ43hj74aYKHaqEyXBGEY
         Jteh+59ro2QErqWilUAxck/yVyhUyvIAOknnsWYgRJMRgG6I/ps8e03pj/TjQIZ7gCwb
         NJFnhev66Ignf9erqwAn07pOyaMx7icUbIx0s8u5SPRzJweKB1en4GBPngkSmOlazJns
         WQORHOusX8JcsM7liJtLlwQnv/aYjMj9PmdgGrxbLj1dP+p2YCP9yQPWMwTamwFazlFw
         XJv6g8a/tKYbSU/iJraCwMRzFkB1Mj5RXs19Aqb+wJbeQQ5FZ9bCZUtQOSKbydwTpnPP
         iSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q2i0/Ey0tSMSHM+5aSopggFEzD3+aGS8L94B43akDcU=;
        b=ca1mPSl4CNlC190hzDzXmjH+LJlB1h/g2ttVD7GbayEq4joPv9x+09877E1OFE8YoB
         KA8Iy2Fmt1mp6N/vzP3nIYH0PlnckLPH8pRMQyojv52cvd8iZMa9Wcc8J8UWXsM7n8DX
         NXrSjA+p2BkchKEzLCRLEf1RCC1jUMmCC386By+xGMmWveuCOIlE5mV8w+ExTT62YBAD
         EQf1jAccFdxTmavtRFfK/yVJcoC9Dv6kA0j86QoXXwS16NAhuhuaJt79qkD4BS3SP9mQ
         hV6dscYsVjqivQ0UimcBhugU2HqMHuziuvBtHDV5/dtdd6BJpLUPwEJU7Dl/J2zJwskY
         rwfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=0gv03p31;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
Received: from radon.xt3.it (radon.xt3.it. [2a01:4f8:190:4055::2])
        by gmr-mx.google.com with ESMTPS id s22si127832wme.0.2020.04.21.03.04.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 03:04:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) client-ip=2a01:4f8:190:4055::2;
Received: from 217-133-116-244.static.clienti.tiscali.it ([217.133.116.244] helo=localhost)
	by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <ms@xt3.it>)
	id 1jQpl7-0005Bz-4W; Tue, 21 Apr 2020 12:04:05 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Marco Solieri <ms@xt3.it>
Subject: [PATCH v2 6/9] driver: handle loading to colored regions
Date: Tue, 21 Apr 2020 12:03:48 +0200
Message-Id: <20200421100351.292395-7-ms@xt3.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421100351.292395-1-ms@xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it>
MIME-Version: 1.0
X-Original-Sender: ms@xt3.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@xt3.it header.s=201602 header.b=0gv03p31;       spf=pass
 (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted
 sender) smtp.mailfrom=ms@xt3.it;       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
X-Original-From: Marco Solieri <ms@xt3.it>
Reply-To: Marco Solieri <ms@xt3.it>
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

From: Luca Miccio <lucmiccio@gmail.com>

Do not use the memory physical address start when loading into colored
regions. Map the memory starting at col_load_address instead.
That region has been mapped by Jailhouse with the same color
configuration as the inmate and exposed as a virtually contiguous space.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
---
 driver/cell.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/driver/cell.c b/driver/cell.c
index 50e344e5..f4bb8986 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -325,7 +325,13 @@ static int load_image(struct cell *cell,
 	if (regions == 0)
 		return -EINVAL;
 
-	phys_start = (mem->phys_start + image_offset) & PAGE_MASK;
+#ifdef CONFIG_COLORING
+	if (mem->flags & JAILHOUSE_MEM_COLORED)
+		phys_start = (root_cell->col_load_address + image_offset)
+			& PAGE_MASK;
+	else
+#endif
+		phys_start = (mem->phys_start + image_offset) & PAGE_MASK;
 	page_offs = offset_in_page(image_offset);
 	image_mem = jailhouse_ioremap(phys_start, 0,
 				      PAGE_ALIGN(image.size + page_offs));
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200421100351.292395-7-ms%40xt3.it.
