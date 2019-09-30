Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRVKZHWAKGQEVHVIMHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F5DC2635
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:19:35 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id z8sf4947241wrs.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:19:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569871174; cv=pass;
        d=google.com; s=arc-20160816;
        b=x/iXHmjETda0An9H8A/Wp4cUljI8egFV2EdIh44Su6AXvmv6MQkO8O5YUSYXQFd1Ca
         2F6SXkbpK7UwSU6IuJ0ixzlSfgFvzKoOIwDW65MXrYdMNciLYLdt7Eio8IB0ku/ycVf0
         mo3PhiflZHbP7pRsKs4nJppchXawENhAcGOk+lE+2M3abugSRxZ8H41wzaX/QXJ5Lz+c
         n8PGyV1zd/XwkRCaeGu6fo5UlJMsClKoy9VGjCjzvsX7iHSkP/lb+fZP8h7zv6kPwRSg
         qpRzpn/9GR0I2Pxw9jPCo1AlG0mgRharjwXDhCdBdNLB7Xsja22M+Og6QBR4AfKo/ePO
         7Ejg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=t+UFDV0j7hpRfu03ICfGYWJfjgEM85OFu67AwY3mEoM=;
        b=cLtol4ZR0kMVXeL0tmWAOBEL7u0+UIjvB+43NSkwQIEnU2dmLX/dRiXwLf/WuRR3pE
         qCshvZqNoLN6AIy9OcR6quurIseG1QCtKo3sbrGf7fVEi2Uolj2pA2ckYUGIS7kKROHb
         PKGa4wryNkskWj50lJ7cguGyFMsRYywlkZ7rWv+rIlfm9u/dXOuBf6fwHP1glN5I2Vet
         TBpODAdsYe+2UcGB7XXssG9hq9YMkB3zWoYP7fll14LlQwa12tuUljnR7R2muTw7C5Ff
         gNMXyh7oQOOtFUXw5loInQereW94Hd6xsSS1VqscrYiQY67VKhTcXy1SFBIhNQ2moWV/
         BK3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t+UFDV0j7hpRfu03ICfGYWJfjgEM85OFu67AwY3mEoM=;
        b=JoOlLO3cBSUdmEwNxgtLQhGfW2X3DW+eDl7rU3YRqNEaT9tsJYXQOci4vuFuYPB9Vr
         3LHZ055+fwxsAsZXwkhtjY1j1kL2GDi99h8T7BGLqNE+OyLdqNNlL/ecXzRDyTwNdktF
         v43a/Ui3zW+h8cc1xq5LZ8hkUzT2n2ZiXcyRdn7hKeSSaqoqrn5ORSiOx4X1cZAHecEW
         IHnmtG05XcbJATYcNVbXJ7gZc3sdNtJ4ukZmmCvwcOIEceINYvtKbeAav9sjifwh38+8
         rSAebuIvft5pK67uZT+XDgXIpLP7X3ZUYdOov+EUwAyJ8HzMdqBqvGWIf9vHs2IWEscw
         +ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=t+UFDV0j7hpRfu03ICfGYWJfjgEM85OFu67AwY3mEoM=;
        b=EZwPjCcL6f0uPD7h1mO2cRDLhsCBEsCZEguxrPPKE/9XWKsN3fa0yn2VphUgWrJbjP
         FZPAtM2eaogX+85EqjWRgFOX6yAqy8Wbk+eiWg1FYkj4pbanW/bb0K34UZcrFrsQdZsk
         YgpgLsBc/W4vKqXOiXs8FrXxoC7Cj32Co8r+WWvXVIdWBY3UJpS8Q+G/6X5LJnA79fZF
         NXLzVyNbUxZtW9OZqd68+I61PHmtS5Xk2tizHtMXXd3y76fhYlIahX+Q3iV3KOwckdkh
         gD0uPYICDi/DtT5BvyYi6ITeelVAwYFqVVByOJGvGAbCYW34KbjJ5MTcwL4erILwG5Te
         H4fQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWvYIdxd8brlgRVsBPf4d0IAsPnOH3icoB24hfKrX+o4B2IY+Lo
	4i0I69kfy/EaJEwOAibEZjE=
X-Google-Smtp-Source: APXvYqymAnQFPTpo5VFLW1NurSO2hgDAVdVhPqYEbCZFqfiimxfHkPChTEZC6A2O313ihVGvrR5mgw==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr12265008wrn.48.1569871174834;
        Mon, 30 Sep 2019 12:19:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:630e:: with SMTP id i14ls3359232wru.16.gmail; Mon, 30
 Sep 2019 12:19:34 -0700 (PDT)
X-Received: by 2002:a5d:4350:: with SMTP id u16mr10916724wrr.289.1569871174176;
        Mon, 30 Sep 2019 12:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569871174; cv=none;
        d=google.com; s=arc-20160816;
        b=JcvKbmfbiKBk4Oz4TEVRG9XG0mNW/OhzloaiCVrYsR25Sw5Pwxj8eTUJYfdVscgS/A
         UxVga0GWCOACn7Us6OJAkrFAlVYGbg9uWHvdwU7vRX74utastcRFQgtqYd5va3j/NWyN
         R0crY5AGAv/O2tgBawLArssk3H/zbTfXXVrFtlRYxLNzHHhZar8sRRlwk1GQxa7T0nA0
         s1SFJkHwcfN/KD3cm5y6umB6epB0X2mgKoO+aaPLKUIP1XbiNhLzDwKARdP80ZOHrepo
         eR2jPIpG72lrd0Xl1P5knFIfCvpG7easfRV/3hZ4am4n2/ND49pjzRvy+Wt5e1fKHj/I
         Z42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=5WtBZ6i2TcvbrAazI29Sua20yD1IBAFkR1psU+ENqYM=;
        b=OBTpdUr4NiNXQtDWrs0fA1ish7k/eufL6ZV7IZ2gCq1ONKMR6SKqyxJ3ZRqoqsKLfL
         jlo6Hblc3vEN2kNHEPFc8mmSW+oQiTnZFzk7GtrRRpq3OS8zG93okwaVkYZ0HL4Gq+3U
         IIg2ySxUYZlqb5QWMa1nEu3gWHxrn51gpHxvq1mIRK4wfk7wdkHMITRq1QzKs9JzSxCp
         hvNaxx60AvBDw9iTvuLTP4uODIxhriiybN7JvOxySDQegLubtNsbnsQZRcumiPD6+DMZ
         lenXO6BU2NZ33d2qDUJ/ptnpdXXA5lcILHA+hJGaih1bh2ps3Zn7GDXLe8vDGXLqHgpi
         khhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m1si767248wrs.0.2019.09.30.12.19.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:19:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x8UJJXZZ015345
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2019 21:19:33 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x8UJJX3K004525;
	Mon, 30 Sep 2019 21:19:33 +0200
Subject: Re: [PATCH v3 00/14] pyjailhouse: x86: Implement config generator for
 port I/O
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, ralf.ramsauer@othr.de,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0713c187-2670-7914-1ad6-561bc4073920@siemens.com>
Date: Mon, 30 Sep 2019 21:19:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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
> This patch series eases configuration of port I/O devices for x86
> plattforms by generating an initial PIO region list. To sustain previous
> behavior, most entries are disabled (commented out). Only whitelisted
> device ports are allowed. This includes the peripheral PCI port space.

Did you also try what explodes when enforcing the generated list? I mean, if 
there is no mess like with hidden memory regions, things just Just Work (TM).

Will have a look at the details soon.

Thanks,
Jan

> 
> Additionally the code paths for memory region generation are cleaned up
> and streamlined.
> 
> Andrej Utz (4):
>    tools: jailhouse-config-create: Rename regions to mem_regions in
>      preparation for port_regions
>    pyjailhouse: sysfs_parser: abstract parts of MemRegion into IORegion
>    pyjailhouse: sysfs_parser: simplify integer formatting for regions in
>      config template
>    pyjailhouse: x86: implement pio_regions generator
> 
> Ralf Ramsauer (10):
>    tools: jailhoues-cell-linux: cosmetic fixup
>    pyjailhouse: sysfs_parser: remove dead code
>    pyjailhouse: sysfs_parser: minor stylistic fixups
>    pyjailhouse: sysfs_parser: simplify statement
>    pyjailhouse: sysfs_parser: introduce new class IORegionTree
>    pyjailhouse: sysfs_parser: move parse_iomem_file to the new parser
>    pyjailhouse: sysfs_parser: make regions_split_by_kernel static
>    pyjailhouse: sysfs_parser: entirely separate IO parsers
>    pyjailhouse: sysfs_parser: remove parse_iomem_file
>    pyjailhouse: sysfs_parser: move find_regions_by_name to IORegionTree
> 
>   pyjailhouse/sysfs_parser.py   | 245 ++++++++++++++++++++++------------
>   tools/jailhouse-cell-linux    |   8 +-
>   tools/jailhouse-config-create |  25 +---
>   tools/root-cell-config.c.tmpl |  21 ++-
>   4 files changed, 176 insertions(+), 123 deletions(-)
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0713c187-2670-7914-1ad6-561bc4073920%40siemens.com.
