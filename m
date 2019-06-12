Return-Path: <jailhouse-dev+bncBC33JYE2XMMRB5MRQXUAKGQEEYGGVAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x639.google.com (mail-pl1-x639.google.com [IPv6:2607:f8b0:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAD342F4A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 20:48:22 +0200 (CEST)
Received: by mail-pl1-x639.google.com with SMTP id r7sf10318593plo.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 11:48:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560365301; cv=pass;
        d=google.com; s=arc-20160816;
        b=nlNPzMJLTOD8CLUKfGIBmo+IXbAGt+WK1iplnNbdKP2vDGeQbkkyN4D+u3ITX0yfGV
         WBK7fj7IFrO4aN6oYzQVHaqdPZxBpxnoU6GLMOTmO7I37Q0pA3k17WLvvyb2PS2WgM6x
         LzjUMUsIZvgypbm4H79jfvFpEWYT6dPV/Ef3PmkBh9OM7r9HS6sKV107aAE9Ived7XTm
         kXnOo6xrmTvE0IKdxPDlprfdWF2MNEMglIhwbRVTxLl/AfTPzqDsF80MHPF5e8J7rnDL
         y94Xpcf9KBzGbWdLzWf961jXkMShJmvlH0LZ7dUrR4CdTQxgKFhXOY2yBXDgL7QEt4zK
         rHvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :mime-version:user-agent:date:message-id:subject:from:to
         :dkim-signature;
        bh=ZqixWD6OSojWBNnE+WmSyGAPT20BkudLLg2H90bT4sE=;
        b=A5ht4c7qxJJyGyhs0HPnZ4dD2jO/+/usaYVPWqL8qNgaMEAWPH87n793WG1fLiysys
         fkIdnq5aLePGMQQCcSvPvfSgM7Ba1oAUZEWDG6hUfY0vri67Dud5HbbID0j6RveuOexn
         UUaulrmed1/mifxtrYIjaF7VaEMlEDFB3OxVXWjcB0H/LeNjC51cPd4hf7PcRfGyutAT
         8s7QV6sWyHilhTvxqTpPtv/kpXMb/hzqbR4SqPx9ndKKaizbJrvbTHE2HieSuTtJrVx4
         ONUlpyCHhyVQqbKY5tRkyF7hPIQ21G4zlzwBEO1VCNsn8nfDnQL8dKp1WXS9swtoeYDZ
         rImw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tj9A1CTM;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=ZqixWD6OSojWBNnE+WmSyGAPT20BkudLLg2H90bT4sE=;
        b=UOQNZB4KMqR4INXDrCCwucPYHjxljqyqpRtHMFXtOkj1G/oS7WL3KVCywxpVy/fny0
         BZCulCnx74hdkSqQD+CR/YxLxvaGUc7XW2pbdBc/8p7HfyudoFy4IsFAFXYjvNfSrcuB
         t9C8IiuyuFb5MdRo7LCH/VAG6r0E1srZqw9akiooUhSWpvN4owDoicmt4jVSuGPILmqP
         9l1+s1j20xx5oOiflRt8fVerIwMyhMZc2bN0UV+Ctiwrv25VlsOCCgronJHs7TOM+jj9
         WpeTqeg5c/8zarxK9WYisWbZ4oh8/6l8kQ3VLAxlcn0pFQCr2OqZtKDVXACWxIRsUu8V
         94eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZqixWD6OSojWBNnE+WmSyGAPT20BkudLLg2H90bT4sE=;
        b=L9QbT0I6E3uYxwbg/V5BZ3iURpErpM/EZfhrWvin82cMObgV9SgOecidGYJfKHPr11
         Qlb8n5v/n6s9ey/UfD7mGvTOIg+kkw3x+dFZFElJ8BnzcFGsFxEpRUGcXnTypjhreQKC
         q7PTyfTO/CHmRaE8UC43b3ijcXV9cmyJ6J2MbDTzQae85x8ZqOlgGFqrp82a2zuBYrLU
         cI18na31hS+vckGAdN9/7NzOx6OSS0aBP+triOzvJrJFrnakwrmMTjYVoCOZN3hhz8Hx
         wecBRS6MLGVSakoc7s3DSCBasWqm5JR9nURfJ15HHMw9/PXGdE89MA8+gBHSmR9ncWOj
         SI/g==
X-Gm-Message-State: APjAAAUD5G318h76OH+TGCNCRDXSPlzrSjX5HVuyftan8ldeSU3Hua55
	uWu2bed/UJFiS6OIZq9p9PQ=
X-Google-Smtp-Source: APXvYqyksgOwEWY9tE3F+wLGMMfw0dctoX8Uq9EALMh9dIN4EVoKonpcUSuKe9dFcAINoWbC0hI0ZQ==
X-Received: by 2002:aa7:9aaf:: with SMTP id x15mr36610795pfi.214.1560365301469;
        Wed, 12 Jun 2019 11:48:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:de4d:: with SMTP id y13ls670018pgi.12.gmail; Wed, 12 Jun
 2019 11:48:20 -0700 (PDT)
X-Received: by 2002:a63:2206:: with SMTP id i6mr24347670pgi.349.1560365300815;
        Wed, 12 Jun 2019 11:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560365300; cv=none;
        d=google.com; s=arc-20160816;
        b=A42JZDrz2USpJ12u3DNTgboFaaZEQDI0YmS8Jla62EfG9EYyeR7XaMNJxScxfMRvEN
         A9OhS5mo0QXZKZMTk1bGiMuegBkLAmqqt0rsQAhtewGglCw7q3BA3ch9wR2FDkmEO/zn
         2BbBCOO9R6MBhT4vOiXN4M0gdTmonBvmJLsU6NKiCwykAKEllaY63+HVtMVfha9Ugbb3
         AMN9aHTn4a0KMlBzgd5uBqz0kz8ECdgAexk6jRtYFlpwZ8aAngds30Ex5bBQh/LXfidh
         mPmzZEsGsyenIyDx8cKZ5Qjwim1SJk9rfGRsJHczkOd7vN9hvTQfAfrspAiO+FiHM1N1
         TVIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to:dkim-signature;
        bh=9VHroBjFpR1Mz3Gnikd+u8lbWfsMSjr39Sf+nCgPx9c=;
        b=SXFZuroxz1r3j8wsdim/R9mAe/mWzIhx4FB6VSH1lznOJGvNAfWEaiXZ6VUbS+4g9s
         ac05wi+BpA7ZODmUGo0Iah58JOZUNnXnFpqP19Z4tuwml4JCV5j2MD9Zugis9ZMJpk1l
         kTzyEfR2Ky3E2dyXv0nhBdbmaXQQgSTyKIiYDzq09sPAi97+r/fwY8Gq+Y5vh7kXAN+7
         HgEpAJ7nzF1Ex6pP/jHu6DVeRCocgjsfQ0NjM/f4cvDF0Y+QQQHBSven2HYoHgOwozbQ
         kwoufXRLv7lT/n7NpP0I83og2V6GTlxQa6I2SUyY/g/vbGpOBkProGG/w84+IyVI6URb
         3eUg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tj9A1CTM;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id l63si106787pje.2.2019.06.12.11.48.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 11:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CImKmK022581;
	Wed, 12 Jun 2019 13:48:20 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CImJJI094967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jun 2019 13:48:20 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 13:48:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 13:48:20 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CImJAv044080;
	Wed, 12 Jun 2019 13:48:19 -0500
To: <jan.kiszka@web.de>, <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Subject: porting am57xx jailhouse support to v0.10 version
Message-ID: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
Date: Wed, 12 Jun 2019 14:45:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=tj9A1CTM;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

Hi Jan, Ralf,

More than a year ago I was working on Jailhouse support for TI AM572x SOC. That time we used v0.8 
and everything worked fine. Presently I started to port that support to v0.10 version and found a 
lot of new features. The mane "feature" that you removed "mach-..." and introduced "units". Because 
am57xx requires to have custom init and cell exit functions I think I need to create am57xx unit.

If you remember, the am57xx had its own:

int mach_init(void),
void mach_cell_exit(struct cell *cell) and
int arch_handle_smc(struct trap_context *ctx)

so, I have to implement the corresponding am57xx_init() and am57xx_cell_exit().

Here is the old mach_cell_exit function, but many of the functions it uses disappeared in the v0.10 
version.

void mach_cell_exit(struct cell *cell)
{
        unsigned int cpu;

        for_each_cpu(cpu, cell->cpu_set) {
                per_cpu(cpu)->cpu_on_entry =
                        mmio_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
                                    cpu * 4);
                per_cpu(cpu)->cpu_on_context = 0;
                arch_suspend_cpu(cpu);
                arch_reset_cpu(cpu);
        }
}

Please could you help me to find a example of similar function for other platforms I can use to 
implement the am57xx_cell_exit function. W/o it I cannot bring the second CPU after a cell destroy.

Thanks,
-Vitaly


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2f1c216b-71a5-5a78-79f5-416b11539d81%40ti.com.
For more options, visit https://groups.google.com/d/optout.
