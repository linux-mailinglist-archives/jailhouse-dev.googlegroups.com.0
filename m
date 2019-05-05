Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBT6NXTTAKGQEGV4Q5UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 4967A141B8
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 20:09:20 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id p15sf3858343oic.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hocnzUDdfSB5L3CLhkXPyk7m4dIUjmqr05ttfQl9PzY=;
        b=MR9f8cOb5/Ue25RKZUiJ7QK8hDGsUyqj6jD/m/mFXA5QNqJhHE5GQRJLCUTwTca1+7
         ImUOdnw6hOI62e8hKG+p/A/tgoc2in5zRQlNJahrkpU0OStqsIxWjl5EjcbVS4tJyT2M
         PcyERLCHJIZWTM20IVHAxxM3FQBZOBQc6cj4hloMrXwuoWn/frYJD1wisf0dEa5PyDA+
         h4KAnnpayEhw9KkY7kM/EOlWd9x4ezACuH+VCfPYcdWdV/wnWGrSPYr19M9J2UA3G1kX
         eoKeS/b+J7+iWHV8xUWGOgRArcs5/aaXAyEDHVAExSt/sp29OPIsr+ZiSpl3Fj5MMlt7
         TgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hocnzUDdfSB5L3CLhkXPyk7m4dIUjmqr05ttfQl9PzY=;
        b=fAM9W+FpQguoHjqjefIGeW1vTuiIKcE+e79iAlijqT/r5hs+uSPUW5hvlgwJOciUh0
         nIFepSk+47TVliCXKYGZyo0yd90H0UhApq7Uy3Efb2ZbGyGPWGwSsEjMa3gvfXjwvwdA
         HKetuu7VAcvZlhtOI3IhhfYKaJtMF7dUWRywcM7PPnSpPiIHIgE/wd1q4jRia5Ng4aE6
         KKeNhsf5thbOpyvcReG6efDqlk4sCEpPWtzlIHIXyPJz421oFY4HT/mVF90EIdrBWEjA
         a83AZXUyw/vg7l7b13dhLTD/7k2sly0r8I3bBEtqWg1eZsZcLMl985AeQScuFpH+5LOT
         05Ng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWa9Cc2bVyQsn3szLCTu9OH8ok9gz/kgGM8XziCj7lnaJVhKQK5
	ackRUStGpGOunu7Oz3gf8zg=
X-Google-Smtp-Source: APXvYqwB5IF3ibmwpFLBA4kgCT8TYh/zDPwUhHLKzAjg7oIykBN0vqboG/B2gSGyZvW+lIKrOlLDXA==
X-Received: by 2002:a9d:4ef:: with SMTP id 102mr15205930otm.302.1557079759231;
        Sun, 05 May 2019 11:09:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:df02:: with SMTP id w2ls1449533oig.6.gmail; Sun, 05 May
 2019 11:09:18 -0700 (PDT)
X-Received: by 2002:aca:1302:: with SMTP id e2mr4059515oii.139.1557079758767;
        Sun, 05 May 2019 11:09:18 -0700 (PDT)
Date: Sun, 5 May 2019 11:09:17 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9dee11eb-5bb9-4edf-bcb7-c42ed30e2063@googlegroups.com>
In-Reply-To: <f09baf4b-72c1-d6d8-56af-966b1afbb88a@web.de>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
 <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
 <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
 <8ef112a9-2f0f-9205-3e67-f0c6fed498ba@siemens.com>
 <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
 <26834bed-4a78-4bac-b093-d8f9e2646e72@googlegroups.com>
 <6ca6fe6a-27b7-4110-884f-e3c5be79134c@googlegroups.com>
 <f09baf4b-72c1-d6d8-56af-966b1afbb88a@web.de>
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1653_891063114.1557079758036"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_1653_891063114.1557079758036
Content-Type: text/plain; charset="UTF-8"


> > I have started running inmate cell on "HP-800-G1 machine" with siemens/jailhouse->next branch.
> >
> > On this machine Root Cell running very well. I have not seen any problem to running root cell. Then I try to start a inmate cell (tiny-demo) but terminal was hang. I have opened new terminal to collect some information.
> >
> >
> > Terminal Commands and console infos:
> >
> > Page pool usage after late setup: mem 3884/32207, remap 16393/131072
> > Activating hypervisor
> >
> > ---sudo tools/jailhouse cell create configs/x86/tiny-demo.cell
> >
> > Created cell "tiny-demo"
> > Page pool usage after cell creation: mem 3900/32207, remap 16393/131072
> >
> > ---sudo tools/jailhouse cell list
> >
> > ID      Name                    State             Assigned CPUs           Failed CPUs
> > 0       RootCell                running           0-1,3
> > 1       tiny-demo               shut down         2
> >
> > ---sudo tools/jailhouse cell load inmates/demos/x86/tiny-demo.bin
> 
> Missing target cell "tiny-demo" here, but I suspect that is just a copy&paster error. Otherwise, see README or man page.

Yes, There is typo error. Correct command is below.

---sudo tools/jailhouse cell load tiny-demo inmates/demos/x86/tiny-demo.bin


> > ---sudo tools/jailhouse cell list
> >
> > List Jailhouse Cells...
> > ID      Name                    State             Assigned CPUs           Failed CPUs
> > 0       RootCell                running           0-1,3                   1
> > 1       tiny-demo               shut down         2
> >
> >
> > Is my command list correct?
> >
> > Is Loading *.bin file correct? or
> >
> > Does tiny-demo.c need any edit for specific hardware (currently HP-800-G1)?
> 
> You may want to adjust its output channel if you have no uart. Use the virtual console. That will dump the cell output via shared memory to the hypervisor console, which may be virtual as well or efifb.

I have not UART port on x86 PCs that the general problem of new computers :)

Virtual console flag JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE was added to cell-flag of tiny-demo.c thus, I see the errors. Thanks.


Finally, I have started tiny-demo inmate application. :)

First problem was mem_regions because of inmates RAM in my sysconfig.c

sysconfig.c
		/* MemRegion: 42000000-51ffffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x42000000,
			.virt_start = 0x42000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},


tiny-demo.c
	.mem_regions = {
		/* RAM */ {
			.phys_start = 0x42000000, /*0x3ef00000*/
			.virt_start = 0,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},

When, I correct these problems, inmates cell is created and loaded well. I have not received any error.

Finally, When I started inmates cell, It gives a PIO read error.  

FATAL: Invalid PIO read, port: c5cb size: 2
RIP: 0x000000000000001a RSP: 0x000000000000016b FLAGS: 892
RAX: 0x000000000000b892 RBX: 0x000000000000c600 RCX: 0x0000000000002bc1
RDX: 0x000000000000c5cb RSI: 0x00000000000092fa RDI: 0x00000000000052a1
CS: fa80 BASE: 0x00000000000fa800 AR-BYTES: 9b EFER.LMA 0
CR0: 0x0000000000000030 CR3: 0x0000000000000000 CR4: 0x0000000000002000
EFER: 0x0000000000000000
<missed 19096 bytes of console log>
<missed 24 bytes of console log>
00000000000000 CR4: 0x0000000000002000
EFER: 0x0000000000000000
Parking CPU 2 (Cell: "tiny-demo")

When I correct this error, inmate cell is running well. :))

	.pio_bitmap = {
		[     0/8 ...  0x2f7/8] = -1,
		[ 0x2f8/8 ...  0x2ff/8] = 0, /* serial2 */
		[ 0x300/8 ...  0x3f7/8] = -1,
		[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
		[ 0x400/8 ... 0xc5bf/8] = -1,

		[ 0xc5c0/8 ... 0xc5cf/8] = 0,
		[ 0xc5d0/8 ... 0xdfff/8] = -1,

		[0xe000/8 ... 0xe007/8] = 0, /* OXPCIe952 serial2 */
		[0xe008/8 ... 0xffff/8] = -1,
	},

Created cell "tiny-demo"
Page pool usage after cell creation: mem 4004/32206, remap 65546/131072
Cell "tiny-demo" can be loaded
CPU 2 received SIPI, vector 100
Started cell "tiny-demo"
Hello from this tiny cell!
PM Timer:  4741722760
PM Timer:  5741723598
PM Timer:  6741722760
PM Timer:  7741722760
PM Timer:  8741723598
PM Timer:  9741723597
PM Timer: 10741723597
PM Timer: 11741722201
PM Timer: 12741722759
PM Timer: 13741723877


Thanks.

Jan.



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1653_891063114.1557079758036--
