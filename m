Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBV5ZWWHQMGQEFUQNZJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6834971BC
	for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jan 2022 14:49:12 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id o193-20020a1ca5ca000000b0034d78423625sf11826604wme.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jan 2022 05:49:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1642945752; cv=pass;
        d=google.com; s=arc-20160816;
        b=UtskAE7orO6S+DIBYxph/jfN8fmJg5um/KxiabNv+Ckvjc53pdYmX09cWbJUoP0l9P
         m4Aky0N2dw5+Q6PsgFQHdFqPSLGgbdSTDmrL3uq6DKQ6gbS3H6RAnGgbUWzx4AbI6/OC
         VDzKIie+mURH8EFoLEunDeIDiks6ZnjMkzkzeeOWzX9qAA5jW77G98QVTgmQhp/y51ka
         4SKq/q117yO23DVzJKLuxdJW6XTtpJwHlOg5rHCjr6m4uryj0t72nQO4wxQf2yEBVnun
         2sM8YNuMiSk/luWI5jXGLymSHEPs6rBDqc8bZu4l1prMLDf4c8kS1muG6/WwU7bsG3L2
         O6lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=ZvYGT/X/91D0RLGDSxcwu6Q+R7GY6AC7YVxoLI93/vg=;
        b=qO0y1xxyUieiK24BCiFyd2U/eFsKDF/ySE/6NfnAPSvhhWYpJGq8TUFgLbDE/4+FLO
         RKhIm/0rJT2LIDnm002r1QL8fOMMNfK8UPvMfX25v0SspT26IBNKZMjBcZMV5rl20LCx
         oaTPuU8ld10Nv10rNqumNs0/UVOYHLYOmuvvxDuVU18lpHvn5qDDebj991TcpTX9L1pc
         yDeQmNJGutUiEB6t2TvuA5r6CXnhN/heocm873XPNOKjqeCtK8dWZQfCO+/byNZKP2aF
         oc6ze8X4+k/yBl5VRoLKpB2N7yyRcHidaspWnzjXGQ8ti41lAEG8k+ib9FDVz/D0ogD5
         US7Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=CnrlNbtX;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:from:subject
         :content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZvYGT/X/91D0RLGDSxcwu6Q+R7GY6AC7YVxoLI93/vg=;
        b=GrGzdiswDxu/jfnu4r67FH6WTAcsQ5eaGZHNMDHwi1yuwQ70Q/gDp83KejHQB5yhhT
         nZgUnSGGJFPNIo1DUWKM8ia0pMbIQ+46EmbeDpJEUTjZTAH9ojVF8pkfSM2IeUXWtqA1
         Ehq6jjY0/zftrKcxbwPk+lnioB/QefZUjdRe1QLFtwjG+GnxXluLJ+KgzHp0VfNeR/m4
         Z3chi4JdxfKCaozxUTlbps3TKyLknPYQxfbkidznFWeaq1ZwezivsgHkLJp8H1nXuPDO
         /jt4weGOGzMhRRZwXsPLuEerh18wbVU32wMTCuRBwU/UE0A3t+WWkewBVyFHLQ6QfCQM
         Pt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :from:subject:content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZvYGT/X/91D0RLGDSxcwu6Q+R7GY6AC7YVxoLI93/vg=;
        b=6JKE1kFNWnkqhya8gqG+GrP3cmXLz0tn/B/riioPgNLFmCs3KoY1Wcpj2LS3uYGwzM
         QQinzpdXqyxzmbjcqtIrhJVgjEJif12umCYPT3roZ6sK1iBbf2SR5j2YnOj5RLR4XSfl
         JGOS0Ps8fnvCESPIvqcBHkWXj+ONG6m3LcHkY8x3GHXF/U5hRwlzndmV37fpIPMEwo5D
         6sHvc7wzYxkvYaFRTsKt+i1BuZ5Q+sLZTbtQYRKrn96zbpyPoFKlSKgRuWTV1lgv/S+i
         hrPGVQzrYyZHSVeR+rS3oCq+wl1YwcTDLkbwkxpwf5bhSxvVAUtkHL3XAz9WKk8YycW0
         TCow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ZKf+wtyrvMdn5zjmAVuGNPFcKL3HRgPjUAfr/HH2mUyR+sbe9
	iaJex2J+ebO/cSq9QTZEj5c=
X-Google-Smtp-Source: ABdhPJyHbv8mTf8ToFauV07K0gxKDxTjbBqeq6g8Yb7gCiWd6RIn/vYkb2tpctlQkhz5zqxXHwCUqw==
X-Received: by 2002:a5d:54ca:: with SMTP id x10mr10538051wrv.557.1642945751876;
        Sun, 23 Jan 2022 05:49:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:6009:: with SMTP id az9ls184569wmb.1.gmail; Sun, 23
 Jan 2022 05:49:10 -0800 (PST)
X-Received: by 2002:a05:600c:3c9b:: with SMTP id bg27mr7966192wmb.163.1642945750825;
        Sun, 23 Jan 2022 05:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642945750; cv=none;
        d=google.com; s=arc-20160816;
        b=E1dhCx5T1UKJYqV0z/2sWROKezj+y0mXTA3RniFFV4dGFUNEF39+/3RzSAetDBDgA6
         xOYuoyfaB4XTinafe9shwjHoah7h3ti9bS6RcJTOJUz0qT8/K3KnQ0JW2z8SHNnwrruc
         iol0VCuD9P7ssphsReuLa/8YqDdEJt7dUyGEduLO1IGAZnDafHqlg4lSaWcFo7suPJR1
         gAQiQ3TJnYEdBcg0Q8jN060Yf0d09AIMVLSxYgJBFOBSHTd6QYKzbJnldy6EcMcfZUnI
         4gAwUjxII7eN53+K2ttnzaNDw4frsK5X9APgElsWvl8EAbDKoJp4VHfVXGVSuJ3c0lZX
         x2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Dwp6ivTOwapbDkhiNIitDS6+jfkcY4kfPzJgi/k6fkE=;
        b=ypNxbwxMVd0zyXJGC8Lct8z5ZrOR+k8sZ+rohsdBYwsRDXqEE5lXOKnyUWvwNVCbyL
         uC3IWHNTrFE440GWDSZ8qv6fOe0h82IzMqS+RxzjUfSA858MZjsUREAN8JP5b3o/gv+7
         ZWtpR+nUt4lpkw0/rayuKrLwrcvFkTfwOC5S2rfjTWIANsCOQiSKcRCfkA6B6SnuKA3w
         NJ3BZSFsHCDZtlZAHOKVqZDzN5gCMw0eBf68jgpHaUpnhugpDX+kj9Q7KlbbxP0mfy7+
         k1jC2TCo5MsQZhdqLb8NuddVmSutXLbzOHDw+66x2IHolbp7zIlBRJMay05FOefMKJWw
         iWag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=CnrlNbtX;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id e5si608769wrj.8.2022.01.23.05.49.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 05:49:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N5Ug4-1mEreu1SZO-017H89 for
 <jailhouse-dev@googlegroups.com>; Sun, 23 Jan 2022 14:49:10 +0100
Message-ID: <bc07147b-3e53-9194-d5b3-419f6a432b7a@web.de>
Date: Sun, 23 Jan 2022 14:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] inmates: arm: Add missing FORCE prerequisite
Content-Language: en-US
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Provags-ID: V03:K1:mnn134uRw8Gi/ADBDGGYGYdfL1X4AXjz02OJVa7BCt4zcsue8PQ
 iIELGkQhUJwKPcrShQAl45dmAwPl239pGyxUGR6t6UKPwCWi/0GbTYMFo4wCEQD9D5b39W7
 UTNP+lla0Olv/Yb+eM3rkSAAMxzvvql5EuHEaaXK/BHctUp5FDlTsUXKv0K5/oXHenEibC5
 Jgs95UajEw1/UCpkVQ7IA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AIedpEitn9w=:mXvilklKLg7nZjr8MYdUpc
 L0RDLRKB5O5zLe9jYuN80NtoJIO7QstZbNEV6D1rn/Tb9PtyWlp5KrR6LXHWZc8i4J29FMZsb
 RV/Ou7vV5da5rrcPaKWcxYFhMCSYhLjnT21/eEnHp4MHSX1CcIt0/3RZrbWeqlnngNYzM2DdY
 2yaco+uZkkIiYeeyJCSKjJEEJoYBlzZGivu+4r/5p3JFHGtMLrdfR7Hlr4McKUp8kvcgFRJTW
 +8SN700SydbXjZclfW927t5xNebo/UiFYkA6xwaNVYTgFXYpO4c/EusRRCb0+tEqqdbgbSXxg
 FojOs59oMY0B9OGCJKNTZpFqq2z1rsz2cM284FPA762/ylJX5gdIWs4/Eu5VLRdjY6cNlAfDl
 tAcfpbgPA2ie7lL+9llo704v9Ah2/Uc8OUVXN/jI7sPdGJEd/a0nEcYYJgMWZLxf9yRpco0Xq
 elap6G7e0Fli6TbEO0hKUnX7X4ms0voJjW4Kfye+29cWpKGDEDw3O1W6zcQZr+hjCBZ1p6eO5
 RDq+hTYhUXkHn6J0OvODWXnibYfVEduDPIB1uS2AZgvS2rCbIWsK30kMc/9a9IGf03nFAUeq8
 q7oH/kgECK5q2xtLpm1ghCi4bN1PnhvdZxsjWkyx2OeWK71y9ebNBXBXGJHh5gelmikzUaQQU
 iFFZXfIPZTGXxW2QkelekdpXmNVJ/IXDR6sX98uQa5ORT8ybZbAyE9vhC7YbZ1KjPwQW3a+M0
 ZJAEn0ctfdz275+mXIrhpJrrLSV99nsOMrip9Ga86Vq4I9M74RKjlxLnofrqzZLRsmopyJ20+
 UV2T7+4v7fx4GdIa2WZWne7j+bpOhoTReXPmAacDF8MBWDR+dwU2g0wOnqvpDm6Mwo3ORZ40/
 TLcUBcNSeOItlWw+J7g3yj17ZaQ/fOGMLX73LSqZqKziM2FeC+6V4JZYgGmYJzkGPRczJIjsO
 KfSIVus3+LD4MwBvHOvOwsIrKA4KHPHgzAZeiME0zMi73Uvic5UivKAEPziyoNQsTJpOqlZ7x
 0MQyoX9NBiSLOljoPtCKmLuGhup3px10NEfD6S1H4npRC35alo52SviJfutZ0S5Fx8SHgOl9G
 xeotXPnYKluPp0=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=CnrlNbtX;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

Missed in b5a39e1746dc.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
  inmates/lib/arm/Makefile.lib | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/inmates/lib/arm/Makefile.lib b/inmates/lib/arm/Makefile.lib
index 2ea037cd..5df2632d 100644
--- a/inmates/lib/arm/Makefile.lib
+++ b/inmates/lib/arm/Makefile.lib
@@ -58,8 +58,8 @@ endef

  .SECONDEXPANSION:
  $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
-		   $(INMATES_LIB)/lib.a
+		   $(INMATES_LIB)/lib.a FORCE
  	$(call if_changed,ld)

-$(obj)/%.bin: $(obj)/%-linked.o
+$(obj)/%.bin: $(obj)/%-linked.o FORCE
  	$(call if_changed,objcopy)
--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bc07147b-3e53-9194-d5b3-419f6a432b7a%40web.de.
