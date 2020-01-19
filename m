Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBWVOSDYQKGQEEEWA57I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id B55FD141D05
	for <lists+jailhouse-dev@lfdr.de>; Sun, 19 Jan 2020 09:46:18 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id ck15sf19588172edb.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 19 Jan 2020 00:46:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579423578; cv=pass;
        d=google.com; s=arc-20160816;
        b=c+C814Fs/h4kNfBNqURDdZf0PNVRFu1PPwQcU51lmTfH3Kq6R0yfTtxkQw7yru317w
         3a/HisjBKmsNTbOz+fKLHuJeRL2vkqtIaukRFBxAq97HaZI/Fv+2Sbs9BXOl/Lt/5A0f
         ND3XMfvG/GbjdNhmqY85o96FrXtrcOamkasJ8TctTr1niyDI1Hh0mCQkBNYeA+XcG9To
         QdD2Fivp2k5RB6enIF8ifG1FpG38vLr/nezq2naBjk4r/RnwOwuZJd8vEZ1kKMN0501I
         Pv30E1Jb49iEcUueaEFacRJTCOr5qfrnxDsT6J03b0USW5Ix2IxBlzEtCbdl7fyZb6Ld
         +C9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=NQzeojwD6uYErLXwl47pll5PbYWLZOaQsH7qALrHzt4=;
        b=PN0rb9HO2yJibQhEKKUZIFiuZMegTlYni5/eO2Xg5KfFRmj4AL7rkcQrBMfotmTKJi
         vrIQhdrdF6FKtn33i+M7+cs/2e5McWfHWNSsJAVu/ZdAlQ0Nm45dr6b8T4Falmp3Vyy4
         OkeKSLIaVSYZexDgVrFD/7Q9/iRWegbEoW4RhkSqt36HTKSDgdZnTTTryK8zwqsvhDe4
         5tQkqcj8ya+hSl1EfZfrIt4Up+gfKP9RqyzxA6aPDhltlytqFdHqF++xZ0IdhCOvUpzY
         hhoreVEzYimNmVS5pjBtCkOihkxKvA63PoNDyKzAB8tSdUWzgNGAoWKNxxjH7i7twpCX
         PqrA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fdZEEktB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NQzeojwD6uYErLXwl47pll5PbYWLZOaQsH7qALrHzt4=;
        b=qFOibDzFN+2ftI8I/e1fwDbTdr2uWoEMdkkNPlQC3d7RMX9G0e4G4ZNQTtiOwbtZUM
         R9WcryGsUKJ/c6FBvF01krsX/rujDltQQVaaNbYTJwe00AwFClnQIfjpiEhBf/fJWkXb
         rq7CbsTxfV8l/Pz4W4pMOYT8PxwE5CQHYLSN/KdRu/y0zIXQUksofbxGu0IBx5zXSPto
         on+Gqn9TVo6niPsrU7Ak4CCYIp3ncMgCh1MF1IVhXuas44XVh1p/rEz/k8xD/OrUkA8I
         +3ttIqVu6/Nr0KiSs4QwDFqcTkDN4V2Ol24KiTk85N7VU2OhSaV7JTWccrDLlLyRBFwL
         8C0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NQzeojwD6uYErLXwl47pll5PbYWLZOaQsH7qALrHzt4=;
        b=BZFGHBnNSuO/Qs/5aqdTiHn9vdaVEPaKh5LV/ZSxoItFfShq/GCwEyyRhBNdBcwMxf
         rVs99/8RyhUj/KmlRbuM/cOE3XaAh90j/aOZ1TJBLpAarJig5MoWHpUkfobQZX9aEVTj
         Uax2O/jfKX7vT/Mdb04P/nNF5HhvGdoP1779aQvsMiuXmddsDtp/2Pb7ejTHPaYGVLgX
         /RkUnhltat8PDEVBjBTW47upXhMwA6iIdDBBMQiRr9+XiICkgv5aplaHB1zCGz/RVGT+
         XUK9gfz3OTgigYfDEz5DZKh3A+fvxSkIH4uFDdQI50aMT+mlYFVhHUEOPZSYa67ZZYh6
         08VA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVSlxprf9hJ8mt8OnZtZyA2n0O71wqKfX9EwSvffOxF2oABlyAE
	vaBijJdGiGpRvs0jk2ic3Jc=
X-Google-Smtp-Source: APXvYqxTGbOhEl4nVklBcoc2CoOCu4zzuJbs9m3BQCFfpQCEOEQSaiTtRXqDsjvx6uWOzWvzzQQUKw==
X-Received: by 2002:a05:6402:305b:: with SMTP id bu27mr12256765edb.191.1579423578436;
        Sun, 19 Jan 2020 00:46:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a2c5:: with SMTP id by5ls8119384ejb.12.gmail; Sun,
 19 Jan 2020 00:46:17 -0800 (PST)
X-Received: by 2002:a17:906:b850:: with SMTP id ga16mr15531616ejb.232.1579423577691;
        Sun, 19 Jan 2020 00:46:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579423577; cv=none;
        d=google.com; s=arc-20160816;
        b=dCePICdmJFPwu4ONB7G6RryNetgEJFuwUAkQgxmm8UVeGON0Hxs65w7UjdHR/elnNX
         /9lwMTct0KR1luNE1h866A86xzzjMdO+mToSAKW/r0+xzHJSrxacQZOLe0dzg79h1Cza
         we8Jg3l1MWXlW/tSG4if0EYrhQFIbKpeEN9wAlUO46d0x0gMyPH8tXnAmCiTrXPbdoH7
         LFM2/3YCnWZzLmXlVuTtXPbvSbIPn9YlhFQ+7B5CqyswGUvvQ6MtU5CGlXeLdbTEZ6rm
         9dKhSg7vMzdINuLlzdYkoG9CpbZlWrGI4Op2CkUY990beaBijbkxv8Wtku79DlNvTRB9
         ZlvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from:dkim-signature;
        bh=MeCa48yZhVbE8sN07CBKgZdltLF58hYPJ8tT4rxbXuA=;
        b=HdXgBt4ki2qufoB5j+mKGvUdkUHHtcn9/CqPefNZfSbhZVvNOkZtsqL4S0p44Vk0pS
         D8QACNdOJ/z4o84oGKMIIKijZ2uULM2cHy/Ca1miyzxsmS7ZAE+JqkrS+0OzVFocUvAu
         pQ/ZhMyUnlTyN0uCJcAbB7ieItafJruN8ziLdjD/3Qe9gHVhFCwp6WcuILLLlhOeYR5t
         4KqElDsckjSJzhVMLz81OTshuavUtjet3mivHLjnJGU55bhkuvoVQbP0Y5artgLE9ft4
         Y26C4EL6Vo7iesb3LWkD0sWgiOkmfQ4m/tRjLNf2KfWXc18q79FOGtwnR629BLxkv7m+
         K9aQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fdZEEktB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id cc24si1411801edb.5.2020.01.19.00.46.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jan 2020 00:46:17 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MOilO-1iwvRG42oI-0067ij; Sun, 19
 Jan 2020 09:46:17 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] tools: config-create: Adjust template to latest changes
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
Message-ID: <9a327d12-6114-79ed-5691-e4d74eb8bb59@web.de>
Date: Sun, 19 Jan 2020 09:46:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:n0ytDcZlIujwhZFsd6BQjFCWqrcI6SCEJQuQeSVnS55kD5T148f
 QIbT1jWFoudMcN4mX//h2D4C3cYv73yeX8rgf11mKSZotCIm4X86KtWiyaK604GwmfOgGFj
 eqSpsyBjIEedv6uupeQOO3a20GaHg4Q5nl4Xo/h6vrBU9EPHSMRXXtAjWq20llnSoV4QCg1
 XVKbigMxfG4odtMXN+B8w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JT7yHR68jSE=:vvBNfj8VM689TccJ2f7bmH
 Zw9mxm11b44s3wrFQGiFBVCtP9n4Zifkqg2iwHfvW6SRHSQwaVVkD+qe8i1RuXfD8+DiY37I7
 lYDtMkhBU7ah7+1i/CPFMAbXq75SwY1hEapnsyIZ/owVBc098wjGO/oQO8nJT/o9Pe6ciC9cK
 FiQMFIQcY/W2duRE/g+C6zVloNrGO1Q5YyNBDUfPKQ0ULIrfaXxKab8Py6nq/GTt3qzEVPNkL
 x7NSPvFJR/TOdd/xwYpw7F2nbBDK2wKJn2//XSBdqBDNJVA9FHJXurzJ6u+WiGdHVyHiF35YS
 H3IUodWaZj+4BbuPlstc6yyrdB+8/hJ5t/FplZwYyoruQephM2fr0O/Z4eaPphv8tYHh37rZ4
 k7vY8ZaGA0iLoJ9+kLqql9/FBsmhW7pUhfrmAInvR7w5kbY/YIeNjr2u+9FDSLL/fh9sdLrvl
 HOHMVhRC4Q/kU2k05R0Z5PfLLw8mPg5Ts0T75zrtteE4rQJQ6T2kP1N06vDEAwu3td2OCkoRU
 xtVTCgmixJbBuT+RWIh9Vshp5WrWVUKDmULmKgw5axUG5vNNkmyF6pQl60jgc7PGIby0Ufv1F
 Jxg1ihpiJizsrR/xZPIykSY+JntjK03f2FtzzCXgag5YacNu9YfxAfLUZc2ANfw4rqyN+nsZD
 S5cPMGJ9NXvZKVb1fNp92EkoRll9A52goPTLo1HGjaOSCZJpRO92jXJ76t/VdXB4KE4gjhJ6F
 c4mMX0MeqAoBIhzaNVh/FFk/HDc+nBVIxX51lLeRSiTLXp9G+C776lzLR/iQquKt7xMlrV7Qr
 2O79UlVIbQeFsDpldPsRqFpv05nftXojdJ1/khCpJyOdElhkCAZCi93a0QfYiTavARHmSGC3g
 oYSlq+yE1QdAnEU6U3uDjH1jg2LeOgNTxqkR9Kyv8T+ef+63q1kMmsjNemAZ4QMO0G7NTpHYy
 /L1gOtjm8ItoS7+PzRyoSoyESq4oGzNClKB/slVN8I+DTU5uYFWZvvt6GMFGCiBb7B48htvpf
 bWDmFuClBjOS5UkVNoHPzPYDp8yhVQQae+h+AGt9mtQGXfTzTC4uyM7X+WfX4aQyhsTGgkz7U
 eYlaqMymdPFrVt5ucbbxc/lCnzjtUjVjO4jxTgvYay4EyiTqN8o7s7+uVH8LcuCfUwyYGDDki
 i3r3mXsPc2iwSdFyJckPALedUddTF9tWB2YWKCaxYbeCuQizhloyVmdksT4nqMO8ZRnuy8Bh6
 Tgc+Gj8TzA0EQvriswGIrLBYSy0NsqcR0yAuf93O3GBotp1rsw9esro/z+R0=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=fdZEEktB;       spf=pass
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

This was forgotten in 3fac413f0647.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/root-cell-config.c.tmpl | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index 8f654fa7..cca273ef 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -94,10 +94,10 @@ struct {
 						.base = ${hex(unit.base_addr)},
 						.size = ${hex(unit.mmio_size)},
 						% if unit.is_amd_iommu:
-						.amd_bdf = ${hex(unit.amd_bdf)},
-						.amd_base_cap = ${hex(unit.amd_base_cap)},
-						.amd_msi_cap = ${hex(unit.amd_msi_cap)},
-						.amd_features = ${hex(unit.amd_features)},
+						.amd.bdf = ${hex(unit.amd_bdf)},
+						.amd.base_cap = ${hex(unit.amd_base_cap)},
+						.amd.msi_cap = ${hex(unit.amd_msi_cap)},
+						.amd.features = ${hex(unit.amd_features)},
 						% endif
 					},
 					% endfor
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9a327d12-6114-79ed-5691-e4d74eb8bb59%40web.de.
