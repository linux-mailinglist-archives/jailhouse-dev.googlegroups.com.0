Return-Path: <jailhouse-dev+bncBDXJDZXNUMORBLGRUKMQMGQEU53M2VY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd37.google.com (mail-io1-xd37.google.com [IPv6:2607:f8b0:4864:20::d37])
	by mail.lfdr.de (Postfix) with ESMTPS id 497AC5BD3E5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Sep 2022 19:36:46 +0200 (CEST)
Received: by mail-io1-xd37.google.com with SMTP id e9-20020a6b7309000000b006a27af93e45sf71011ioh.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Sep 2022 10:36:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663609005; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ij4PaLm0hPe7IPP8lV+oSop1OZ0xwVZ1smUGzLTEK+3PQBhfxnclkPOrD5IPs2PXqy
         Wrz9Nu45e7qEvXEdGUqETPchxP7eGNAT3nTKfKcPpAMjmVLId8Hz0/e/q0RCsipUZVkw
         LX2HWveF6Mn6OaLYk4KwbHy/UFzUNecSb75Elzfaf43WoxEzMvnRT4tA+16HUNR6X8qh
         KeWqXThIok+yfHoQh3FhEw1IaTbEHc8Ybx/bXejMysL6FHplsY31x5/EY6Zwp2TsJjhG
         m2r67oMSF+oNvwPQ1WFZ9w9tnt4P9NYLT1E5b8z06YdE5wakJ218fLdIzBk682i/uoIl
         TPdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=S4k4FKOV+0QwqiO0Ny5+TgblQKo0oDWixdSsC2LVcMA=;
        b=x2I+JkNhr+ftcGvad7ChnaTy6jXQMLP63r3Np+KRCIxNL69YuGyLOyfMcpBC+zBlce
         q2YKOEFgrkkB2zefJZB3WJtGf8trGXzFHaPcAgfFcz0QSJcnFw6UF5RRSWTJiFnar0lW
         b2sHG/fGsd0zIdxWSe4hAusoYm1ArY6F5k6qd69Gf+rqq6ZjcRoyv2H+KG72a4RDZzsF
         qRdmEWUnUqUItn0U9jkBjFcRC+cObdebVRfSKMlJ7STJ5Q7TuqJ2h/z+SJEmgunvVbr/
         hspqprNByUeWCehP3wXfCrMpulfytX/pJcri/4NaMqa8gxBTVL8oJ2I7yrtHIRzcpu0t
         TX9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Ewlo5IFi;
       spf=pass (google.com: domain of helgaas@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=helgaas@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=S4k4FKOV+0QwqiO0Ny5+TgblQKo0oDWixdSsC2LVcMA=;
        b=jHR5LmoGdTFfwJORLsNcH0BApNpbTzFfbScq/FV43pIYJyVDV77cluztPa0eCFmJ+g
         IuLvjQDrsjYNhXBfrpvMP9bJqIukiQ4qEDcwzv5wPBUkP14DcRhoYiYJi76TXNjZUyIZ
         e77upZ7Ez21O1aBTbHb9qrpERBtycWAAyReaT8KuHuxtmKW+dQCO1NYJtWUUocLkZM9Q
         jtSMkGmDQ6tcWuibs1nlt0s77BudBTqr35SY7GrZjBALgO/4hbWGiwC1Bu1M5t3ze7w8
         6eE4QEejbcC7CHTK6chzPK22oAz56mcQjiMHPRrGkmZhC+l/94vkzlzkzvTzrTqQOum4
         LFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date;
        bh=S4k4FKOV+0QwqiO0Ny5+TgblQKo0oDWixdSsC2LVcMA=;
        b=rFBsyjijhxhEs3acYkVDOlr+4JAnTXu/FBoopbr7PcxNXGKL4QzJglbgXMHsvXm1hl
         FaBo0PTklkNui5UWzSZIDqn1GEvYq/0Wa1HIKTrJ119py6rGB2OoRX++ijJYJB06a5Dk
         xslmzdvO/eXq9rnKoDtVb+ko7AC2mkqqUNq3cgSdBrUmyZ+u6rdbEfBFpoBtBNj6ghYL
         qaEa3lUFzHOSlSvCMEDhOfy7ya1vtWePs3fsfMOkZOagj4TRdnEBCw1iDg5wk8F9pocb
         lKDJSx2+03blBAnlnqNuWB3zWtQUFhw+SJNUwgY+GG9HMd45DVlDiJNYPyXlFJ7y6FOm
         hw4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf3pmwSr61NtTG1Jbv6pksI1s4fGfiQh0XWp0V2B2eLmhwqaAk3f
	5aMaJCrkQdGfIAXMf+J7Grw=
X-Google-Smtp-Source: AMsMyM7Tu/sssm45HqQZNie3+Pt4lUX2oRw9xuoz/G1PEuHl91cnW5dtD3lX0zcDpYputxJQidJFJw==
X-Received: by 2002:a05:6602:1402:b0:68a:9d38:8248 with SMTP id t2-20020a056602140200b0068a9d388248mr7274115iov.68.1663609005054;
        Mon, 19 Sep 2022 10:36:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:11a2:b0:2ea:b529:b26f with SMTP id
 2-20020a056e0211a200b002eab529b26fls1047074ilj.7.-pod-prod-gmail; Mon, 19 Sep
 2022 10:36:44 -0700 (PDT)
X-Received: by 2002:a92:c812:0:b0:2f5:695b:7907 with SMTP id v18-20020a92c812000000b002f5695b7907mr3841959iln.64.1663609004148;
        Mon, 19 Sep 2022 10:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663609004; cv=none;
        d=google.com; s=arc-20160816;
        b=P2Q7Mg98OIiw5IhqZYjdBhuycQ7xUQMpyvcqktZQpZtTMPMnetW5hXBDuW4OZJ0J3B
         /uMFVMVotVRbnwepE9M7d8/OOka16N94hJRs9or0eui1cXzDQJVL12/9rrEML4hdUdEW
         g2/DTzsn0GFGi16wTLfy6psFHoyHwqMN0FPMrDybqLmXlUbu7tUY7p4G62j+GNjQ60To
         pGyBsi6BLb0AuoI9cE9Qszq9hXaliGND3N6xH5d+xG7uA5WFKqtFehdZ7g/XH1w/V1mu
         Nqg9lnDZR7x5jdkEH/+22XDkcCQxiEMQ3MUW03J4Fe13RmUlBBaBx0DY2Mnyf4DRYd19
         To2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=6PZg4XeAun2uWbfHKgxcreJ2lA7DohIzrx8HD9KwPiI=;
        b=KkbAr7t5+OQ3W7bmkHlfQwS7wXQjKRmkplVc/1ddOMWb+IQbkzcewV0zyRH05RQnPO
         wkpY2VIv/XFOm1k6AXuEF4VPZ2WqDBTXjeV/SeoWvcgeve7BN4+rhPc44sDXbnbHMQbU
         x7lTjAPJJU2meULzkgHlv0EHj6xmcz9MgaV46EmEaWHum46EUN21NMtnk96XJZBxyX31
         JXSx8XlZ7yCp5xHRoWDhutkSR9ti6GKtIiE94EM095qrYA8hGWjVXkCMAL+CLE2ww6Mq
         9Lbfz1hGhbjn8iX3KfnUdEPqyBfpyuGE9BeUXonWEE2YK9CklY5krw0BRTIrdiiqLMjl
         Goiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Ewlo5IFi;
       spf=pass (google.com: domain of helgaas@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=helgaas@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by gmr-mx.google.com with ESMTPS id g4-20020a0566380c4400b0035a25c888bcsi532655jal.2.2022.09.19.10.36.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Sep 2022 10:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of helgaas@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D966861C16;
	Mon, 19 Sep 2022 17:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C2AC433D6;
	Mon, 19 Sep 2022 17:36:43 +0000 (UTC)
Date: Mon, 19 Sep 2022 12:36:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Liang He <windhl@126.com>, jgross@suse.com,
	virtualization@lists.linux-foundation.org,
	jailhouse-dev@googlegroups.com, mark.rutland@arm.com,
	jan.kiszka@siemens.com, andy.shevchenko@gmail.com,
	robh+dt@kernel.org, wangkelin2023@163.com,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] jailhouse: Hold reference returned from of_find_xxx
 API
Message-ID: <20220919173641.GA1014673@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <0069849b-e6c7-5c9b-4b52-5aa6e4a328e4@csail.mit.edu>
X-Original-Sender: helgaas@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@kernel.org header.s=k20201202 header.b=Ewlo5IFi;       spf=pass
 (google.com: domain of helgaas@kernel.org designates 139.178.84.217 as
 permitted sender) smtp.mailfrom=helgaas@kernel.org;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=kernel.org
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

On Fri, Sep 16, 2022 at 10:25:31PM -0700, Srivatsa S. Bhat wrote:
> [ Adding author and reviewers of commit 63338a38db95 again ]
> 
> On 9/16/22 2:00 AM, Liang He wrote:
> > In jailhouse_paravirt(), we should hold the reference returned from
> > of_find_compatible_node() which has increased the refcount and then
> > call of_node_put() with it when done.
> > 
> > Fixes: 63338a38db95 ("jailhouse: Provide detection for non-x86 systems")
> > Signed-off-by: Liang He <windhl@126.com>
> > Co-developed-by: Kelin Wang <wangkelin2023@163.com>
> > Signed-off-by: Kelin Wang <wangkelin2023@163.com>
> 
> Reviewed-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>

The message to which you are responding didn't make it to the mailing
list, so it's unlikely that anybody will pick it up.  See the archive:
https://lore.kernel.org/all/0069849b-e6c7-5c9b-4b52-5aa6e4a328e4@csail.mit.edu/

Maybe it was a multipart message or was HTML, which the mailing lists
reject: http://vger.kernel.org/majordomo-info.html

Bjorn

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220919173641.GA1014673%40bhelgaas.
