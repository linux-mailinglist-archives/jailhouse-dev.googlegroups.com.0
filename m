Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBO6LT7ZAKGQELQHMCMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F92515FE74
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:12 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id m4sf5345599wmi.5
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770172; cv=pass;
        d=google.com; s=arc-20160816;
        b=QjCOo18zSqXUhQiBxGanXe+Riy8nbyXIuY+2wVYp25xyB3577MPDhZDdqFqi3VtcMA
         ScKAk+N/CYGEDPxcMjEPmPa3kfOLzkqUL2AIjzNMJDPz4k0Pu8QekWA2DJ159qKU8758
         6oKXm63PoQQtP8aLwJC4DqC3hcWtojA3n0NYQSu+amOwiSY0rKZaXwL7B4lhAaheOSn1
         1Q1gUU/jp2L62UD8ySpzST4XBuFISAlvTylqd/q3Sc1qoG2lzw5bs4dQWWo0mizZE4eD
         TvCUStu/AxordcTixXvlRSYYGD3FwK49agagPc8nyZNfyDD87G3UDrAg6K1yAcq7Jb6H
         1JLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=aBN9t3trLMl0CKNL/qXdjGwS4w9Z7JA9fPPXqTN/20Q=;
        b=Yjj5JwOjgHMsTGRyygUYLjY3QDsar+Ps/VBz/4DwBPRQWRtiIeBd8t9mIDkXeLSBaE
         hIRygib8S7iIxMdxqaz0uNEamBivvfiEgkAKXdu37z4QMBucN/MVfllJDklhRmINoPAo
         RUH4QAgOHLdGPRa9vSoX1tIfB5QhahtgQ10y7jgIl9LfiQLR1Xyy78mtdgNJym09Gxpe
         ZBY4qho0G9BTuRA+/QElVm8DsprBkdrdSP+c0C0nAzxFRnOk2APFytj1g9lJIunYCABC
         d8pm7eQwVocoM6F82rnZ2PWSAFL6uzYQ9ZMd1YiOwhaXrBZuCn9Gq4S8+rx0gmQgXy2O
         cX9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cyzwZbpq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aBN9t3trLMl0CKNL/qXdjGwS4w9Z7JA9fPPXqTN/20Q=;
        b=cFFTzO+uEgRQ0lfCw1pw3PhGUlQW8oi8V6ZmeOwEbxJwcV95thSZ5fL1sI0fCe0LLp
         ZH6hKPECcXZ0+mVHbxFRSZ/hO4sJCOlvC92gX5dOFpZ0z50up732nzGHVMEmi0cJyrLi
         7soqvAq5Aez7KisXwN8mz+qw+drnqS/6rrcjyOxuQJXg18sR+CJxm4sOj7E+2v4Hqhfb
         8sstsOqpkdNKVbV5Jr5flc/R7osrEUYbyPSFyjAqXKBo25skkXtLMKzaYXcYDrLWsur+
         Cnz5N2gNhekOOMtS+D1NHbJ5JrXT83rrHn4hunGaT4EY4ujVbCNXATXqguFI9HjhFNwR
         IexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aBN9t3trLMl0CKNL/qXdjGwS4w9Z7JA9fPPXqTN/20Q=;
        b=LvNTqckfxph2t1Kz+8g6/z9Ifx2wFkEynKq58cRJC64D0TmeK3zy+ao5CCbkLG4+fq
         77Y5eClBYGaQ3B2j8Pr618c3quDobcPfszXT4eUQrm9kuTHO1UvD58atcuNrQsR+srD7
         M/cFk0E8PryEtGRaCSyYbCFjU8ce+GOs0CwevYMv17BvTtQ0FEhFFE84Y2EFa3jax/F6
         6Yq7FalYkpw6kaoBetNYZDKJqh4DHt7HjowJ/4bbeBIRo/Cw4n9Z91L1YX2fWUqaXbXm
         AG2tkpfBhSWySTN91Joe2fz29R4zcjXhCWHJtPsuVRWVThdOjhyLuoX7PP4AJDJfNxdS
         265w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUgTNzdEbtz0If5ecZCSeWi75xIorjiz5OH1Cv+Hnp7R6rMzbek
	gSQd3bJVYck7ZBi8Cr8zCCc=
X-Google-Smtp-Source: APXvYqyImX3t//vaMiYWhExmO1qX65yEh7kIkS2jfP8ShIb9O6nloY4xa8Fyl6FYBnUM5Xfx3qLHgw==
X-Received: by 2002:a1c:7717:: with SMTP id t23mr11332156wmi.17.1581770171870;
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:288:: with SMTP id 8ls3013949wmk.3.gmail; Sat, 15
 Feb 2020 04:36:11 -0800 (PST)
X-Received: by 2002:a1c:7712:: with SMTP id t18mr11198605wmi.32.1581770171286;
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770171; cv=none;
        d=google.com; s=arc-20160816;
        b=w/pblKYf8VntDMl/C1KbK/pxPm0gpAV1mum5XvYzcHn8CIVIaNG9cvpxx24XvLdnXG
         xfvPKWiL6IcDN9CxT92sXMxIURQkk0Bh/y0fbIxUONQSZ8GKJ6VbnZd6D0nF0DLosCr7
         WOGcw2Mg4DyvjWXjFnI3nZqeopOwk0SxZIg2KVYk+fCO4drz6oZvbm1V5MOOjifLn6Nr
         Z13nNqnRPwyeziuceMKD5mDpKYQtpusTirysjLo6leLhc5jMV0EVnZ2jPAtBOW54OMZM
         jeLKCGxi6FSUBnWg/pZar8DUx3bC78RYjgqsfkrM9wTihYoaG3EYRtodaDnflyB0w1k5
         /OtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=aeE+9RNaA/yH0vkD2ptcwi0liw6+loxl8PdHPr3EaOc=;
        b=L5JvdIvyYT5hv0cmMl9xb8J3z9nCxT9gvP3kPooGWzSVlj1xWUb0fv3u8ox5GfSaHz
         4Qox2DLSC7ts7b2QTG4g77RQJZEl1OGeBac6+y2LmH3PG/sBDFMb95mLqP9zR/ZBy/a8
         h6LCDQiZX3yV/bDstpQgS2+pPMGjlKytTd1xzjM4EUEX0Kpu5HCSartQ9yAP4+mfNnQ8
         5J5vT4R1aP8soGx9AgdybChelA//1y7OnMeRUKkKLhnXuWIGL0DEw9ahxJLCvsOSmKVz
         7qF0e1mUexQWVwd0efub5dvkfspEBtN/IqaZsN7OZmHTB4lMAK25+GRmToCe/wn1UCWC
         dznw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cyzwZbpq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id m2si271717wmi.3.2020.02.15.04.36.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0MejX6-1iru4I3YWe-00ODfs for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:10 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 10/12] Documentation: Remove obsolete description of CONFIG_BARE_METAL
Date: Sat, 15 Feb 2020 13:36:02 +0100
Message-Id: <a519daf7568dd81add59d01440c808489d081ef9.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:JffLWjQUk9kL3Ix72fnweMuX5PtotaHIN6OOsyaSpWLTOFqdmri
 avFv9kswSwXsLGrwGAydYqMkZYZ2hgbCpiDAA++KGRbAri0JDTmoOHRxAue2BDiFXaQzayD
 aDY/w74E+i7dGKmVhezwCa8+kpd1/RYxmXTBH6NR+46p3jFId5wKuW+qL39LtPc9jCUvcP8
 egm3ILtlIqWKHEEHwCd0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:htkk1HVacjM=:gaXZAStwfxcmKFtHi3fRG8
 9LjQg83BQsVS/Qc7D8hJgUJOBBOM6XE1k7fyyXqsDi0K2F1Cu6f8VQ53Dqwd/L6KioGXiW/k/
 IVSrofIteJ2z7kh/AE1OagljW1T1/cQzqFEY7W8zZgjX+4Mj+1+prRWGno/JpwI7MQJWXDUdo
 NNbcTZlzKvDWKp0Aax6NHRpiSs+zPpHQmPOMY9EOYKRkKsKIQC9zDBViEPQHHFIQAPxvQD47F
 Dcq3ZyLbTV6MR+QcCik7xQt+VR1Aq6SkwQi1CwN2v10ZW/0nP1j2885yiKj9ee8vdVovCFdNS
 4gQ0qGMddLTZMSzvWtxNjkT0+fEBgZ70uOBYzSFdM1p5xmi3m2JTyv4tdOGDpmaMzaam49+uf
 q9xo5cWFMH/AM04SRL75ALSOMyWN6oUH3vvYKg3eyfqZNnWH+Md9UAZLfFUZPsgoDEKKD6+lb
 E6ngQLTCEYJHKfhbWWwDIuUVkcCbjkzh0wSVGMbfKNIurAVvgB5cy6qC1iJj0mxnIMLdmfvE8
 6Pq4wG0loO6Mb4jgcsH9dVoXzTJs3/r32H04Rsv3sy53P7dmwqm4r53H0JHWf04uQQR+wH+wg
 UZgR5z7EpsRZaW1VBVCJMZLm+78DdO6W9fJ15ZLuQpmaYJbVrvjk/Ue/WvBJKktrGr1zuwq99
 RaaatIxSnZ3eF+F82/Z7ywrrQiGdTPe0EXjOVcnWthGvJPcCe0DV0D+k7bna1TM8crZn0O8eV
 brCMcWwPqApQ2bhBFZyq2OpXtUZ+5QHS5LAsCrXec7luVoQKQ3R9Wvj7TStilOljHxHW2Rd5T
 ho/Dobj3K+XU8gKIF7+KglbiE/pmndC8iSKyBKayHmUgGY3ddWKIK0BWoJ7mUpzd3GM+PBYib
 JMygmSHqaRocvsfqeqLzGtIjQRABpG6v0/RXsBQ/DN9GHc4RWAEUfwZgAsouaND1MxEp2/GgJ
 FRkGrj/Yh7dgeZV4AMfdl8PE5AOAwmQN2CoCsmYRJt8TQXhJ0TywM0RQFzFDkWtDVbSQDeBFN
 f63ZvIH8t0mnQzXAqK++FD3AK1Fx3puHyVzSxKeizAAUSo2QC6vEGpYpR47bvuauK9RTlLd5C
 Rd8xXpTL+8acGdUhz78clvr9tAzw1Estcv3a7IMI0Dqz0Td/jdk9UcZa7pPnkWH/cXCDkIwgh
 aZYG/veyXLXlzacfJ5b2AMzMUl/AmbSi4WO4Ah8W3nVB39W9ex+Eks/HQ33gxZOyq6O7n+9Fb
 OPWuW7j5zvaS+J93F
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=cyzwZbpq;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

This was removed by 006918caa2b9.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Documentation/hypervisor-configuration.md | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/hypervisor-configuration.md b/Documentation/hypervisor-configuration.md
index a526d0c4..7d612091 100644
--- a/Documentation/hypervisor-configuration.md
+++ b/Documentation/hypervisor-configuration.md
@@ -32,16 +32,6 @@ General configuration parameters
      */
     #define CONFIG_INMATE_BASE 0x90000000

-    /*
-     * Strip Jailhouse specific parts from inmates (e.g., heartbeat()).  This
-     * allows inmates to be booted on bare-metal, without Jailhouse and is
-     * mainly used for testing purposes.
-     *
-     * See configs/arm/jetson-tk1-demo.c for the usage of this parameter in cell
-     * configurations.
-     */
-    #define CONFIG_BARE_METAL 1
-
     /*
      * Only available on x86. This debugging option that needs to be activated
      * when running mmio-access tests.
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a519daf7568dd81add59d01440c808489d081ef9.1581770164.git.jan.kiszka%40web.de.
