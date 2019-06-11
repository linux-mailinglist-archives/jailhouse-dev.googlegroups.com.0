Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBIGW77TQKGQEAGSF6VI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CD63D4A6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 19:55:45 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id a19sf2192521ljk.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 10:55:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560275744; cv=pass;
        d=google.com; s=arc-20160816;
        b=Fxr2rhD6VHgL17/pqNNtA5Bp8Vt+d/2zkquKO2ht8Ci2iUOUIQsVRIWf8rwIycbucF
         7v+T3owUP4NePqvhx34zLZxuCugDLDKGaTwWlagVwZGth656E4xGqeiFFtWwP1EtJlJZ
         +qJVx/DqR194/l98LzIsLXz1VoxlcObuBFGA5pTt21xoaShx99owL8yISLQjC29X3NBi
         FHScfIySjCQ2l59Fv4B6WGMobYnOFgrlJvZcOCpXML6UNLmCuU3tnDrBCCuRx5oivdB3
         GONq6ytZCemGbePMMkT5LNTX/01lm6RFtWtS/PBhmFnQi6YfQBMk8gwbH0Xj+9koSsBx
         tuOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=0Dz6oAIniDNa7RhOJkKiB1nVLtuoQf0JL3tp1X4coQM=;
        b=YzQ2QmACzZ/zdBvS8gtuEEGste/l6BQJHN9Nx4/l9dbcb78ljeZHqGehvYfZhv8yUM
         e5B7jzGFTVpV3S6MLmnDGjl2NB/vaTeJNz3B+VWlrORV+55uQ8rdP6sy4bK46IQnesGj
         OQCK5+nvz3mFXMUh0qrSqAW2oMbezHknSuIEWkyaE8VXZIM12gS/qiuvoMcyrHnYyJft
         woOmpJxuGYeqSs5JOQjIYFL3Y/6yn0IvY/+ekpcKccORw6zMC7brPcJhHEOCudCSQtk5
         OvCKlxueUA8Yr1VfT06mio+5dTiQrezDynNUVIIr9RQrHsBC/fai8O5rzCwwa3g5xv0/
         cwkQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Nw5b3gys;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0Dz6oAIniDNa7RhOJkKiB1nVLtuoQf0JL3tp1X4coQM=;
        b=Z4aeIPXvsBa3qoqvCmrxl0v6J7A4pD1VpGNQrgFrULCJfEtUP2UCsnSuLKAtWaSKhQ
         PlggXdRbgBSd/dGKNLx5AexWsSHpHJnwiIAXBv4LWOQa36sHTLufNTL3q0+GSKzvx5MO
         bqRKR+EkQvgJGTRlFEJYAMqGag/YUOV3qSCH30hXWYpB3yU+LcExrvLGtoD3Fv7O2PjX
         aZ/IUFZtgVqcY6gKQq2pmw5dtvDm9d/p/KbXWCvPbBWhhN72ilDcTH5RxhMt/UG9NkMz
         4Ve1h2HKRbrNBgSoklBt/gtnvjVj9vBp3j18aHhw8DTJ8vIS+niMCPYxuhSK1d8+2IwB
         usFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0Dz6oAIniDNa7RhOJkKiB1nVLtuoQf0JL3tp1X4coQM=;
        b=Ywf4bh84hKjn/y7p7R/MzkCOERqpd+2ubKAviaVj09b9g3La3JUgtOnfutNrfWg08D
         DTBNnPc0LYN5TX9tn+J2KYDWG9beCaMucGxv2bGNrbXHRSc9zCnWTzwWbblqM/FAILRo
         FAyrMhhNMR1QMiN7oTRQz9RfPz0COZA9u5NCBe8MAZDtiFQhCvW8g9cUpcSWxjXsRyze
         eMEvPA/8QhX5j0s8Lpv5ptx4P7+cVh4TEOvD+F2WSmW7oyRnprOR6mgT4VQ1ur160waP
         1BgA9fg1sBFxrvY2HQzTqJPmMuESyLB5jFlAX24GbqFFsohSdYQUJPTmxJGi3+fYHPix
         /M1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVVD/eLhvdYA3b53JpheKjUrBnFkY4qXopkK/en1mvwca4AoF2y
	XyZTf5+prd3Jpot978u54Pw=
X-Google-Smtp-Source: APXvYqwDGi+yd9r2V8UFnXxWeuxYtnPGye1fUEoWK4yWG2PkJsRFHHsuI23qSZPjIc461A8SxSFUSQ==
X-Received: by 2002:a19:8c06:: with SMTP id o6mr21851736lfd.176.1560275744696;
        Tue, 11 Jun 2019 10:55:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:553:: with SMTP id 80ls845828ljf.4.gmail; Tue, 11 Jun
 2019 10:55:44 -0700 (PDT)
X-Received: by 2002:a2e:994:: with SMTP id 142mr10649937ljj.130.1560275744135;
        Tue, 11 Jun 2019 10:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560275744; cv=none;
        d=google.com; s=arc-20160816;
        b=DlYf0caH0j2G4HPBXBinXA4zSFBawbxc22qHuSphbuCS5ctqe2RzHm4sxsxvb2hfaR
         Tb6noN58XdZtSs8/ZtOFzMgOYKGBckgto3H2uxfCuEOY87wUSjME43UwaEIIUihAhnSw
         rS1KkxctvilwojjosOGXifncBmqPThpy23WInp4FHLYwiSdj7m/5DHNyuMj4vFl6TeML
         GvoS8BLNzyXyhQiByG3Lnoma8INsraqwB7wQ2oh/wqCMiZSW6F5kwIRG2m+s2xm/6Hov
         3eUlb0BYpD/WUKXQlhwDJHAxkO4XySqCGWzeYc6mYE9FG6iQ4ezSOsaPIJWPh2GfmbvS
         N59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to:dkim-signature;
        bh=NLUmD/CTXAUS86EGAML+phZvIDzh1UZHPAVTUQfHnSM=;
        b=CSzoFj+lNg5qCiKShDU1TS5habqGWg0+YWTgRjC3RwAyE3P0gsLy+/kxHtQSgj3j8z
         ESE0vwNP0itSt1YLfFkbHqqt9gRh2aewmaT9voskMTObxH1z67Y8U8Hj+P4dghvASU2k
         arNfEwjRt/TAi7b8+LdTIs6jFGjWV6+HJ3iA99GOWp0phTaTLYY2uH28Isfno6Yi8gdr
         l6VBaqIk9i3BxsgrG5Nfx1Hub1zu8fZnIE4M/iPa9WV9capguniSlo8LP4X8Eb9vlQW5
         8zLhxCV9T/KLneg8epy0b774SnETVl0+UEhAQpgFFsRVF/2h9MUPCBr7y39Kg/07B4x1
         nwyg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Nw5b3gys;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id o20si628399lji.2.2019.06.11.10.55.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 10:55:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.11.10] ([95.157.54.22]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M5fhI-1gdADn09Vo-00xdBh for
 <jailhouse-dev@googlegroups.com>; Tue, 11 Jun 2019 19:55:43 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] core: Reset PCI devices on CELL_SET_LOADABLE
Message-ID: <d973f654-32ce-b98e-68a1-a851d84620f8@web.de>
Date: Tue, 11 Jun 2019 19:55:39 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:ofeTNhTgp5xqylsDtAzf25J+cRLjB+Ln3ODtxN0gb+bcyyWgmEU
 kb2ZU1dgtPL3msHaJF8J5lHPt/Dg8fU/Zvij4PKHDh3F18wguj5DwPp+X94DF5drwSsIc+C
 YM+pWyhAHvl8m4HkVBh/HTiDMAuybZCkPx60wk0jD4AYjMKSCJrXQrIM59sCcSxBR/D9f9p
 pGcF4Swn/WhrKyvHECNTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dLqhmSU76bs=:ikNlOmEkNRFu+JoagT9nyz
 93lKYOGFlnoeSi1NU3odxePaWrn06rwx7xsho27EbqgY452wn6Doku9RU8sGSlUUbVA/M5nVM
 34go2NoFI+4Ong6ZrWNuYWTf+B8JqpkEJUpoakC7EZovezisDraB41Nnv33rpEgDEf9nwrjac
 OXmALa7gtLwgTsmtY+ZrOusqWvWa14DulHqZAyNSN1gPF6FbfjEWbxaQoBlerUUZ4PEmFueG3
 aIOVmvwP1/WIhR1TxdoE2b2WmKnJ3A2XSkNGlh6bGH37cH3u3f5vbou8iJNjx3ShFTje90L+v
 67EqIGB1p9nJbE7TGQNOW16bPQsz+8kVZUFgACB/NRTv7DchUlmoqbkJyr6htMaqtQ+SjTm2x
 sM32SnFq/aXg7qug1N9FsRaGisRIEM0XGBKtjFLDSjj1YrTErv7uEHauAUp+fJU8p0Ku3OEvt
 EIyAFHFjqbyui8dE4SQCBw+zluyyyagLzdjr3R1whEipYjCNNzh1nMn3OnUOopXi9ogqH8xzO
 pDhq6rAVe5wom8M7IGI1xt7eW9ymD/O+nWyooIL3y6c3AvXSG7rUPygiycaf4MKamWTv8B23P
 P5/UJeOnslIsVfPxTcc9c0j8kuXOZTyNtYlW7jbwlj4W/KX/6I8DrEVDNJ9/I3WwzyplMyreZ
 N5PUBiPh9O1IRof1q9sKrotRsJdf96TZfW18GcRvJnMQO6qS7P108bqgNkyfYmGEyUW6aNmqM
 DsZz9ElZbSJWzOGqVJspXTSxg2pOTq2X/6Uo37pR0dQ4P6s7QwN8M2w7tmQgQDgiw7RpKq7eu
 Lom0rUIQRvyaaRjY+Q1pWDvIU2BSZ47oQ7ezkwFtX8e0KhaNJBE3jaLqU4zBah64UXrb+G8rK
 u/7Uu6pWWxAIc4zg+3xxSkE6N4KWDP2oO6QDQZ68kizKWY5fGbewMhRB5TTnMRdX7HWdvKVY4
 fgf6ET+T8fLsGTmuShPkF8RF5H93i0dIXFaOF5dYt4oK5rC2Ia0vStWyAXL2PcQokIrLrDB9l
 DQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Nw5b3gys;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This ensures two things: Physical devices active prior to
CELL_SET_LOADABLE will be silenced (no more DMA) and cannot conflict
with the load operation anymore. And ivshmem devices can send the
information about the reset to their peer earlier than during a later
CELL_START-reset.

This comes at the price of resetting the devices again on CELL_START.
Could be optimized, but not worth it at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/control.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index 0290bea7..ac8e18fa 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -698,6 +698,8 @@ static int cell_set_loadable(struct per_cpu *cpu_data, unsigned long id)
 	cell->comm_page.comm_region.cell_state = JAILHOUSE_CELL_SHUT_DOWN;
 	cell->loadable = true;

+	pci_cell_reset(cell);
+
 	/* map all loadable memory regions into the root cell */
 	for_each_mem_region(mem, cell->config, n)
 		if (mem->flags & JAILHOUSE_MEM_LOADABLE) {
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d973f654-32ce-b98e-68a1-a851d84620f8%40web.de.
For more options, visit https://groups.google.com/d/optout.
