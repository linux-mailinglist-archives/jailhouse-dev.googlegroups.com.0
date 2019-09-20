Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB7HWSPWAKGQEPSSOCBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 699D0B9510
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 18:17:01 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id w26sf1745459ljh.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 09:17:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568996221; cv=pass;
        d=google.com; s=arc-20160816;
        b=DJrjU06+03xLxFHtbONb6k4hBpt0IwP0+SL53vYhZXCcIAON067ycH0FIKQknUQVRF
         uEB7rb5urZ33o7g7Jw5+/E3H62dVgywit7GA+5PXiYezIQF9sfqUrF6i/lZ5UL0fB2Lm
         TYhzKKMRyZuTrUDck1yXsWZIwMoFFnd6+Rvt2yGno+XYf3/D/giI+NkqnKSLN9iYsgkA
         zfJqXKw/0FnLfW9wC8iFWuXgfPREhw4i/ziLXsleX1xBdtpoQ4mlJuU1h+b5KkzqXaP2
         zLv1P88FE/QiIW2+OQ/khSIfG7GnsSyxcOi95ARFpu6ZCM6KFBeTgYFc3/NfznhXA1WX
         f+Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=dZXvx837QZlZbf4JZGIJiir8R/EoxtlMo7gAivUtQqY=;
        b=vCOqDGCF/dU03Olsl/jYjSBz3gLqQaLGCicT4+XKg2VPHmKHv0JkaMv8Eeg+UVvIiR
         CaCZUzf0v5Z/SQpiii+D9kYori7f2T/Ta8MKDUbNsxoSYMvSySeOo4la+PJy8JG5sBOk
         fMQKdGNwZPDDuc2mPrMyiFxwdMKdQTAQtU6SkDqg1SFJ67rbIfCqoQufV38Xw7++bUdw
         0Mm/Kr+SBGw7/hg8zHQqAwaSVbEw2lyj7NYX5Ch/C2WLpAhIA2/GjEzojM/rBv1RG5S/
         70+5Xm/wkKmfVrgRRzr2Dwt0d1s5eVAemn/R6gwZmXiX7sd+0B2wYlJVYeCDHy27vpNM
         YvAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dZXvx837QZlZbf4JZGIJiir8R/EoxtlMo7gAivUtQqY=;
        b=bU41oNIEX5BDvtk6jHGhsgqEuNBpLhuQSt74DMtX1KnTqLtdw+ambkjsyOrWvEm1qW
         +JyDYywsmlieB2HFuxiDqWhINvHz+eR+IEUk1T+zHJnZrfflKoY8wP73KRhLfSVfl7wT
         GG7vBx84EL/NFBIMnyrLccgjefIMwbed0Lv0KZ+tSrh5LFwYUZl3XU8rYMxG9I+UjBTT
         RhRl/Wj4qP+dqbNU43i0EN+8JksF6gTGxR7XI/Ho1o9E0TtW7mg7QZ4iPYXwdsxb8Zom
         qoDNF6QJwk3kAheZVmGiOE0JEb3FEFFl2NnBcRy5RaHeOJGdht+1m8WISkIIZUe+3Yd4
         +yTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dZXvx837QZlZbf4JZGIJiir8R/EoxtlMo7gAivUtQqY=;
        b=ljy+GM/aKdcU8Z5sTFZ8Cbp9MTfLlJ+GInpFLXEmWplHHqGhLKue32Ij4RJpdpXgWM
         6aEE/+ScuBcmbpGnnhheU3Wks738C5np6I+ciNRm+BJXZXrcE9AUvFQ2QdH+IIWeF/mg
         /8OqAXWys4EPzKv9CFUSRN/ck6bEiIBE+WGW0u5/QD/NaB0sZrfEJTQVn22tywum6zm5
         lmu/d1js6Og0toJBEANgT0Xv0wYEeKOkly3xcp8W2gGHzvTVx81atK5YHPzBagsHbFJe
         Fr+Q3sA59hO2XNeXvBQIACRmCp9WsBBFycvygpsswkSZgHctS55Ix6EdbyogTN3jaNtK
         Mh9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV8otJiEeGTWgj4hmi4LT0c9uizxfQQNsCr47soHi9KftW1Rw2Z
	gaHisuCIR1d2ZENZyJzVdjc=
X-Google-Smtp-Source: APXvYqyDC3EO3Djl9Oad/b9P8xyCCx5/iTsKopnzt5pgTKO/0CNDQc9oXlqBHv2LGlMBARt+3VbWfw==
X-Received: by 2002:a2e:924d:: with SMTP id v13mr9505095ljg.226.1568996220972;
        Fri, 20 Sep 2019 09:17:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4190:: with SMTP id z16ls778265lfh.7.gmail; Fri, 20 Sep
 2019 09:17:00 -0700 (PDT)
X-Received: by 2002:ac2:4427:: with SMTP id w7mr9287414lfl.143.1568996220450;
        Fri, 20 Sep 2019 09:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568996220; cv=none;
        d=google.com; s=arc-20160816;
        b=eTkYg2ThBEWskp/shRVMNFguWhyHcSE06ODAV5SLc3CPEniMpvqpNobSxC/QqgtRcN
         TIiI/UZN95COni8qJnDEnG0lyIwqGsGPq8aEpDio5uPiGGph0MrhcanDtY8qgYY/6qZJ
         j738KVhF0yCOz6a15+W+TU5iJQ1Sjua06bNr1VVgJV3lr9frvQtDgT6s9EUFEmKA+W7O
         pj+YgjDn60nLrbnWDCDpaNs65rDx2TrBmqRrvUV0p4206oT06MJwr2fz7zizRFETYv5M
         c7Zmnm9UjSgKE36Vb3YcUZhSj2T3KXj52EoqhpofiTka76gX7gZgPGB2+qTeMWo0y4ZT
         fbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=QH7c2LpDp4Xo2J/eG//nY5bNbjwQ53FsYMg86tAFDyI=;
        b=NenRDpAM9PhY0Dbg27RXeiWK+XpsxB/ZxRiC+C3e6nuTMsR+bfjWtB27SltIr4IBGI
         Wot43erZ85vA9Erwf+J2PfecFxlvtzovSQd9grl1roEdzMkxNqT5agJgl/ue5ZyAyF9+
         beIWTBs0xn1BSMC/QLqIErRQvJ7gCyv52JGDcWlMxct1hs8xc+AO5/BjB/GgoqErCez4
         6VbvwVn/M5BPiqIRmSbw3HEdUuECn4jgazJDs5i36wDbDLC2G0Lw+n7Qcgm+kk8Ow+Fc
         JXsaZSt6ybL+zkl7j7p0TmRLGl+v00MNl3API+0y4fp9N0se8qlMaVJnuagXq2JBzwlK
         7Ftw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id d3si131601lfq.1.2019.09.20.09.17.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 09:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x8KGGx2a010311
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Sep 2019 18:16:59 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.220])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x8KGGxTN016038;
	Fri, 20 Sep 2019 18:16:59 +0200
Date: Fri, 20 Sep 2019 18:16:58 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
 <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH] driver: sysfs: fix parameter usage
Message-ID: <20190920181658.64f710cf@md1za8fc.ad001.siemens.net>
In-Reply-To: <3814a06c-155f-a3f0-9c54-bb2246e19e80@oth-regensburg.de>
References: <20190920145644.2169824-1-ralf.ramsauer@oth-regensburg.de>
	<3814a06c-155f-a3f0-9c54-bb2246e19e80@oth-regensburg.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

Am Fri, 20 Sep 2019 16:59:14 +0200
schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:

> On 9/20/19 4:56 PM, Ralf Ramsauer wrote:
> > find_cell_cpu gets a cell as parameter, but ignores it. It only uses
> > root_cell.
> > 
> > This bug never had any consequences, as this routine is only one
> > single caller, and always gets root_cell as parameter.
> > Nevertheless, fix this by using the correct parameter.
> > 
> > Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> > ---
> >  driver/sysfs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/driver/sysfs.c b/driver/sysfs.c
> > index a272ef4c..a15a2787 100644
> > --- a/driver/sysfs.c
> > +++ b/driver/sysfs.c
> > @@ -353,7 +353,7 @@ static struct cell_cpu *find_cell_cpu(struct
> > cell *cell, unsigned int cpu) {
> >  	struct cell_cpu *cell_cpu;
> >  
> > -	list_for_each_entry(cell_cpu, &root_cell->cell_cpus, entry)
> > +	list_for_each_entry(cell_cpu, &cell->cell_cpus, entry)  
> 
> Found this by accident.
> 
> Now the question is, should we fix it in this way, or should we
> entirely remove the cell parameter, as this routine gets always
> called with root_cell.

Without having looked at the details, just one caller with one arg
sounds like over-abtracted. If it was not factored out to make the code
more readable and less indented ... i guess it should just move where
it is needed.

Henning

> I'm wondering why the compiler never complained about the unused
> variable.
> 
>   Ralf
> 
> >  		if (cell_cpu->cpu == cpu)
> >  			return cell_cpu;
> >  
> >   
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190920181658.64f710cf%40md1za8fc.ad001.siemens.net.
