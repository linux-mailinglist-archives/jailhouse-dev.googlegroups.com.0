Return-Path: <jailhouse-dev+bncBC27HSOJ44LBBP6XSH2AKGQEVSPBWKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C46519A976
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Apr 2020 12:24:00 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id ce13sf20777984edb.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Apr 2020 03:24:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585736639; cv=pass;
        d=google.com; s=arc-20160816;
        b=CLKk5cCp9DXm3yZJGzrMc7xVHZ6qt7Q046uF0/U1Vz3cdlk5x2no+ftVQBRUhm2jnf
         +nTRGXgjoFSb6n/X/JgSlBV/yQiZTZPm1LvH+kiE5CQkwt565T89xYO6sBbgsQtIrq1O
         a7PyJd8X/X5k3K0n9tI5ajphf2jGusfM7XEGYsQU0u8Ia8YZNXo/v8IlnS9RRPibyME2
         9f+oEXJj6L4HmO44n2ExniQs/Y91be/I4theR/Ih/o+QuaH/DxY0zm1JUFr9nStU/+7s
         83x72+dthExEdlNQsltyeSgwxH6tn2YRZ5J5Srm9nMe4ebKrhgBBEpgngsAsZtMb8H/G
         upxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=jaxW9EJyMZ0i6SePUSQ2b9M5PGYP3GRFoNdvVfL7FZY=;
        b=cfv9oDyS/i3Ul6OqCOjamf882ZCmigV16CZ0dDJEwYqbaZE00PFSjGTatmFzawcPJ5
         0/asNFJ209l7nrvrt1FpkiY7py/THmV/EjGC8ZV614e34Tan+nPSjJKpJMjzuYCAXhLP
         en9iOS3gs5EfjVtgk+4/LeFmVDx2yd4ZfYi7vCCa5gBbPzAIvbLc+h/SeUmII9068+9B
         jV+EG+qGxwAg76O2/Lf0VqVeKa9LitHatdAQYlcsOECWvS42FdjO2DAFBtGsf0n3flXG
         4MKyBm6+i+VfKZxiCDXqord1DTrqmbb4Xc/nTuR+93NmtYo1U3jruBjxczRLuxNJelv/
         fGJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of david.laight@aculab.com designates 207.82.80.151 as permitted sender) smtp.mailfrom=david.laight@aculab.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=aculab.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jaxW9EJyMZ0i6SePUSQ2b9M5PGYP3GRFoNdvVfL7FZY=;
        b=r1AuW3Gu31OUrCFgrQkBPFDkQlEJs1iegTCYiYrgU4PJApy6AZRjB+ELzI+HjzJikx
         hA9RFMuulv3lnGCS/E1qAd3A17UscYKesIVKsEkEyZhY7m6YMah/BxJy542ulQbF7VsC
         E0Kvtz8BwDohXWnOtiGOAen5OaEltPAg6+x+2W6YDiL83YjQ4pJ7Rqjx6slCRDd1wUvG
         EAmoAkxNhCokhivAfGTGfzA7RXsLIrq4ROmJwzoS2M7IEFD9zfVGamw+99mTO5sfAeGW
         lJ8hLiSEfOHOA8gHM6GpekQ3bYb67tWEM9K2g0KPygFfvKQlW4Vq24dwFMjlI5MM/UjP
         EgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jaxW9EJyMZ0i6SePUSQ2b9M5PGYP3GRFoNdvVfL7FZY=;
        b=S33DZ3aKa3A7dQJxMnFJY/FyTHF/eyaCH0X3WlOPetPKlLbgIWt54RnnKXA59crr5P
         VTUu7+JSH0EQVAe29CpvXAF6Y68sE3JSUzrZKKEPbnFug68seN7B8e7nZTvE/Qq5sXHT
         SY9l+2vMVl5ut8XSJoJtj/de0MtZxruR3XNkfUHQpPzQW84ScPlQREyRsseEfzRYyX+Y
         p2n+i/j2i5Wd7J+AgfvWDvDNzQUIMCSw03Qz6GDmfogkzep9vwBULGBXy5iml1rlvHT2
         zHhmaISYHKqD/JSjBhIlHRAqlPwOkRdj1an6yISYRIenUbOVaNR9sWqcqD2ll9jXelsj
         umGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ02b86Rk6lpZWyuUPrmxWcJ6ObAwIl+rvG1RzB4ZKPaCdsPpsKN
	qZ3+ydYHvymKSs3JFyhCWdQ=
X-Google-Smtp-Source: ADFU+vuEW4gC8WuwoQtCKoHZXlW9URhzovuz1Kem3AokBq4eKRFp8lFWkblMNev2m3z5Pl8KOB0Wmw==
X-Received: by 2002:a50:c30b:: with SMTP id a11mr20333326edb.285.1585736639753;
        Wed, 01 Apr 2020 03:23:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:860b:: with SMTP id o11ls14755732ejx.3.gmail; Wed,
 01 Apr 2020 03:23:59 -0700 (PDT)
X-Received: by 2002:a17:906:e99:: with SMTP id p25mr8215706ejf.6.1585736639043;
        Wed, 01 Apr 2020 03:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585736639; cv=none;
        d=google.com; s=arc-20160816;
        b=GLl6St5oMSb/KWKFFEVYvKb75SerV8oF+4CxKGAr2dCuZl8R/3J1OpE2DGVjDDL2lL
         K5SBFH9XTpy52+4MCsM8U2TJ2n6FtQM/NXEXNUKEdLFlJ0OTWk1ycTVgmXn0CMZ6nWli
         QixPJOmtjiq7trDeyz8LvlerJz9uQpB93nNcBfQVv6CMOmC39NOfSqb7jn+IOMEfckyZ
         u3fnWTxFFxtE99BNTZlJc+1rQUvDxoTT2AJEAga+R5KxhzFWw4kXUm6lJbzM+DvB2nJK
         TU+IzgRYZ5zPgODGpQHZUw0Hi4BjOi2/6VWB1YKHbxfMdOt8WI3ZkMSMgiEnA+VwiHaa
         cyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=EK+agd8ALK77hipEqDIDqb5PmT5/0qvf8HKmIe4+8Aw=;
        b=j3TpoYWqVMdUomtRMpUWh3ZQWKgzcqCI6lQ5aEQt8we54B6NdKtssFSnXt35Z9RdCW
         NmDDd6zjtQxhkDz2T6Bht+hZu5ID9VwPgCbXlli9DQmjGR4OZ2XvRq4GtdSeT4PUNOx/
         m0oSb/aGQQkp1PO+2x4mw0K0Mq/jFJ0X/il9Lcbpp51om3ZxlWNjpqzMjmOeo8gzuWpX
         M8xfIT16r/gb7y89APYRGbihp/IFQWpNNnS5kuDcDhQSEVIsb/XPcB9khz9YXnAWTlbF
         NVmZWpAsf06gMifhlx384m/dz/LMenQpFPnjBrGXt0rDxwk2vjwwMR2UNWmyZnFDV3iy
         GEsQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of david.laight@aculab.com designates 207.82.80.151 as permitted sender) smtp.mailfrom=david.laight@aculab.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=aculab.com
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com. [207.82.80.151])
        by gmr-mx.google.com with ESMTPS id a10si91084edq.5.2020.04.01.03.23.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Apr 2020 03:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of david.laight@aculab.com designates 207.82.80.151 as permitted sender) client-ip=207.82.80.151;
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-22-QSeBAbmuOtiRMVlLTjHioQ-1; Wed, 01 Apr 2020 11:23:56 +0100
X-MC-Unique: QSeBAbmuOtiRMVlLTjHioQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 1 Apr 2020 11:23:55 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Wed, 1 Apr 2020 11:23:55 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Maciej W. Rozycki'" <macro@linux-mips.org>, Thomas Gleixner
	<tglx@linutronix.de>
CC: "hpa@zytor.com" <hpa@zytor.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "x86@kernel.org"
	<x86@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, James Morris
	<jmorris@namei.org>, David Howells <dhowells@redhat.com>, Matthew Garrett
	<mjg59@google.com>, Josh Boyer <jwboyer@redhat.com>, Zhenzhong Duan
	<zhenzhong.duan@oracle.com>, Steve Wahl <steve.wahl@hpe.com>, Mike Travis
	<mike.travis@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, "Arnd
 Bergmann" <arnd@arndb.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Giovanni Gherdovich <ggherdovich@suse.cz>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Kees Cook
	<keescook@chromium.org>, Martin Molnar <martin.molnar.programming@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH] x86/smpboot: Remove 486-isms from the modern AP boot path
Thread-Topic: [PATCH] x86/smpboot: Remove 486-isms from the modern AP boot
 path
Thread-Index: AQHWB7UNIHnKX6bM4USvtOwoEXANa6hkDYfw
Date: Wed, 1 Apr 2020 10:23:55 +0000
Message-ID: <23147db6f0c548259357babfc22a87d3@AcuMS.aculab.com>
References: <20200325101431.12341-1-andrew.cooper3@citrix.com>
 <601E644A-B046-4030-B3BD-280ABF15BF53@zytor.com>
 <87r1xgxzy6.fsf@nanos.tec.linutronix.de>
 <alpine.LFD.2.21.2004010001460.3939520@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2004010001460.3939520@eddie.linux-mips.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: david.laight@aculab.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of david.laight@aculab.com designates 207.82.80.151 as
 permitted sender) smtp.mailfrom=david.laight@aculab.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=aculab.com
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

From: Maciej W. Rozycki
> Sent: 01 April 2020 00:35
> On Wed, 25 Mar 2020, Thomas Gleixner wrote:
> 
> > >>@@ -1118,7 +1121,7 @@ static int do_boot_cpu(int apicid, int cpu,
> > >>struct task_struct *idle,
> > >> 		}
> > >> 	}
> > >>
> > >>-	if (x86_platform.legacy.warm_reset) {
> > >>+	if (!APIC_INTEGRATED(boot_cpu_apic_version)) {
> > >> 		/*
> > >> 		 * Cleanup possible dangling ends...
> > >> 		 */
> > >
> > > We don't support SMP on 486 and haven't for a very long time. Is there
> > > any reason to retain that code at all?
> >
> > Not that I'm aware off.
> 
>  For the record: this code is for Pentium really, covering original P5
> systems, which lacked integrated APIC, as well as P54C systems that went
> beyond dual (e.g. ALR made quad-SMP P54C systems).  They all used external
> i82489DX APICs for SMP support.  Few were ever manufactured and getting
> across one let alone running Linux might be tough these days.  I never
> managed to get one for myself, which would have been helpful for
> maintaining this code.

I remember ICL trying to get SVR4.2MP working on similar vintage hardware.
I wasn't directly involved (doing SMP sparc ethernet drivers) but ISTR
that the SMP support silicon they were using (or rather trying to use)
was basically broken.
By the time they got it (nearly) working single cpu systems were faster.

>  Even though we supported them by spec I believe we never actually ran MP
> on any 486 SMP system (Alan Cox might be able to straighten me out on
> this); none that I know of implemented the MPS even though actual hardware
> might have used the APIC architecture.  Compaq had its competing solution
> for 486 and newer SMP, actually deployed, the name of which I long forgot.
> We never supported it due to the lack of documentation combined with the
> lack of enough incentive for someone to reverse-engineer it.

I also remember one of those Compaq dual 486 boxes.
We must have has SVR4/Unixware running on it.

I suspect that any such systems would also be too slow and not have
enough memory to actually run anything recent.

OTOH there are modern 486 (like) systems than might have a reasonable
amount of memory and clock speed.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23147db6f0c548259357babfc22a87d3%40AcuMS.aculab.com.
