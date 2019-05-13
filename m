Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBZMZ4XTAKGQEBYB2ROI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 403921B459
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 12:54:31 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id f92sf7289262otb.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 03:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HyR+L0U97WleGkHHX8EAyIE2tZkomCl5kJ4lsKwy0VE=;
        b=Qv+r1/2mde3cDCZi6SJFX/NYTukyjW6yscpf7SY0VDV2rmXu3cfH1KWMvL4QjG9e18
         PqaKaKB89jghZ1BS6IVdzAejfAsI3L2w8FFIz6v/gEsyFQwUbINqi1HWwlh9lxDnMfqQ
         vwVWRqXOCAWFc7qDZ1QbP0VWae4HWu2f2ifK/KqOq1v2cWrhJpxwcJCOkfN79WCCJMHK
         5GLjUOxYWtrQ0EjSkGWSR0RTaSrZmuQvtOiDUrNd1EohPMSfsxzr0FZcbH1YadTVRrkX
         g/Ulc7LzHyugd5jumSLv6sQD8q8uqMewXaqLWjvfoUFyc7+uYBoKo1VpfQ0qLNDpA8fb
         OYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HyR+L0U97WleGkHHX8EAyIE2tZkomCl5kJ4lsKwy0VE=;
        b=s429JdkkkSx8yeqYagHOm/QaefJMOdfjTIUpa+utopAzJpc6mbriYq1kwr4vqkFbeE
         rVwnRq+UAnskCMA75F1/ptvPjfw6FHzcRIbUDNj85qSxkp10RqygPAGWzxJ1yZHzIQW5
         a2cIo53OYzdi5ubGUGC0Yvqa8ECKMvll+Y4NVjSlXKPy8O8Uz19mrqhZvy3qagxl/J6B
         oMz9oyUZJMGSY/gNYoR/hvlfCFYa++gx1aVxkg5LyZOaEudDTVSe8TBt+DFqcQiaiKQJ
         jWiSAFK9ih2J3XgRcN/sH9L22tkIbt3E8VOmys+GIMEHgWa3jcJGaAlhSPw79eW/Pw4r
         rSOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXSviULGIC7DcERBNcm50KUX0mOd6Rk/ZlOnBrc0w1xzVl9Iogq
	E04FmFusNn1mEnYyU326BcI=
X-Google-Smtp-Source: APXvYqyvELupoDs/EHoTY3thjrrONyvBlmAMr3YOg61te8Oo7idJBtjWlXPb0cOETCMUbd/C4jZUaA==
X-Received: by 2002:a05:6830:1541:: with SMTP id l1mr17024443otp.350.1557744870114;
        Mon, 13 May 2019 03:54:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:2b05:: with SMTP id i5ls1926184oik.2.gmail; Mon, 13 May
 2019 03:54:29 -0700 (PDT)
X-Received: by 2002:aca:df44:: with SMTP id w65mr12247128oig.66.1557744869333;
        Mon, 13 May 2019 03:54:29 -0700 (PDT)
Date: Mon, 13 May 2019 03:54:27 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8189ed45-40e0-46d7-ae43-8139953068d0@googlegroups.com>
In-Reply-To: <e48cdd07-eb0b-47e6-bcbe-9d281819a3f7@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
 <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
 <71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6@googlegroups.com>
 <02568569-7d1b-4bb5-8a1e-a5cbee5a77ee@googlegroups.com>
 <b68c813d-2949-4516-bfa3-2fb4828cee9e@googlegroups.com>
 <63282997-5d5a-4c59-9d60-1d73fcfe49db@googlegroups.com>
 <0f2b55b7-09ea-4158-913b-4ec20c7443d9@googlegroups.com>
 <8667152c-c459-997e-42d7-0f908418be0e@web.de>
 <e48cdd07-eb0b-47e6-bcbe-9d281819a3f7@googlegroups.com>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1695_1592432265.1557744867980"
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

------=_Part_1695_1592432265.1557744867980
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

13 May=C4=B1s 2019 Pazartesi 10:40:24 UTC+3 tarihinde jeanne....@gmail.com =
yazd=C4=B1:
> Le dimanche 12 mai 2019 09:51:04 UTC+2, Jan Kiszka a =C3=A9crit=C2=A0:
> > On 10.05.19 15:11, jeanne***.com wrote:
> > > Hello everyone,
> > >
> > > I'm still trying to get my rootCell running. I have for the moment co=
nnected a serial port in order to have the logs in full (in ssh the communi=
cation was down before I could have the logs). After solving some minor err=
ors (such as Invalid MMIO/RAM read or IO-port) I find myself with an error =
that I can't explain:
> > >
> > >
> > > VT-d fault event reported by IOMMU 1:
> > >   Source Identifier (bus:dev.func): 03:00.0
> > >   Fault Reason: 0x22 Fault Info: 38000000000 Type 0
> > > VT-d fault event reported by IOMMU 1:
> > >   Source Identifier (bus:dev.func): 03:00.0
> > >   Fault Reason: 0x22 Fault Info: 3c000000000 Type 0
> > > VT-d fault event reported by IOMMU 1:
> > >   Source Identifier (bus:dev.func): 03:00.0
> > >   Fault Reason: 0x22 Fault Info: 39000000000 Type 0
> > > VT-d fault event reported by IOMMU 1:
> > >   Source Identifier (bus:dev.func): 03:00.0
> > >   Fault Reason: 0x22 Fault Info: 3b000000000 Type 0
> > >
> > >
> > > Is the new sysfs-parser.py the cause of my trouble or is there anythi=
ng I missed in the configuration ?
> >=20
> > Could be. 0x22 means that the device is not present in the interrupt re=
mapping
> > table of IOMMU that is responsible for that device. Try changing the .i=
ommu
> > number for that device from 0 to 1 or the other way around. Or is there=
 no entry
> > for 03:00.0 at all?
> >=20
> > Jan
>=20
> Hello everyone,=20
>=20
> You can find in attachment my new jailhouse-config-collect. It's actually=
 when y try to enable my root-cell that I have this error so my root-cell i=
s not running and I can't do the "jailhouse cell list".=20
>=20
> As Jan said I tried to change the .iommu from 1 to 0 for the PCI 03:00.0 =
but that doesn't change the error ...=20
>=20
> best regards,

Actually, I done double check for patch. It is parsing everything satisfact=
orily. Also, I parsed DMAR manually. System has two DRHD structure for DMAR=
0 (20:dev.fn subsystems) and DMAR1 (DRHD.flags set INCLUDE_PCI_ALL for the =
others) Thus, 3:0.0 pci device is assigned to DMAR-1 (iommu-1)


I also attached new patched script file for suitable new next branch. I am =
planning to release the patch at new mail and subject (git format-patch).


@Jan=20

I have a question about the patch. assign_iommu_info and append_comment_inf=
o new methods is running for "PCI Express Root Port" or "PCI bridge" primar=
y and secondary bus,dev,fn.=20

I'm not sure it should work for the primary bus,dev,fn. It doesn't affect t=
he result. But I think it shouldn't work.=20

Do you have any idea?


Example Device Scope:  (00:1c.7 PCI bridge)

01 0A 00 00 00 00 1C 07 00 00=20
01 0A 00 00 00 00 1C 07 00 02=20
01 0A 00 00 00 00 1C 07 00 04=20

It is running order=20

1.) 00:1C.07=20
2.) sec-bus:00.00=20
3.) 00:1C.07=20
4.) sec-bus:00.02=20
5.) 00:1C.07=20
6.) sec-bus:00.04=20

May be it is run for only secondary buses.=20

1.) sec-bus:00.00=20
2.) sec-bus:00.02=20
3.) sec-bus:00.04=20





000000h   44 4D 41 52 44 04 00 00   DMARD...	length:00000444
000008h   01 69 48 50 20 20 20 20   .iHP   =20
000010h   50 72 6F 4C 69 61 6E 74   ProLiant
000018h   01 00 00 00 D2 04 00 00   ....=C3=92...
000020h   2E 16 00 00 2D 03 00 00   ....-...
000028h   00 00 00 00 00 00 00 00   ........

000030h   00 00 B0 00 00 00 00 00   ..=C2=B0.....	structType: 0000 (DRHD), =
structLength: 00B0 flags: 00
000038h   00 E0 EF FB 00 00 00 00   .=C3=A0=C3=AF=C3=BB....	base: FBEFE000	=
(dmar0)=20



000040h   02 08 00 00 00 20 00 00   ..... ..	PCI Sub-hierarchy
000048h   02 08 00 00 00 20 01 00   ..... ..	PCI Sub-hierarchy
000050h   02 08 00 00 00 20 01 01   ..... ..	PCI Sub-hierarchy
000058h   02 08 00 00 00 20 02 00   ..... ..	PCI Sub-hierarchy
000060h   02 08 00 00 00 20 02 01   ..... ..	PCI Sub-hierarchy
000068h   02 08 00 00 00 20 02 02   ..... ..	PCI Sub-hierarchy
000070h   02 08 00 00 00 20 02 03   ..... ..	PCI Sub-hierarchy
000078h   02 08 00 00 00 20 03 00   ..... ..	PCI Sub-hierarchy
000080h   02 08 00 00 00 20 03 01   ..... ..	PCI Sub-hierarchy
000088h   02 08 00 00 00 20 03 02   ..... ..	PCI Sub-hierarchy
000090h   02 08 00 00 00 20 03 03   ..... ..	PCI Sub-hierarchy
000098h   03 08 00 00 0A 20 05 04   ..... ..	IOAPIC
0000A0h   01 08 00 00 00 20 04 00   ..... ..	PCI Endpoint Device
0000A8h   01 08 00 00 00 20 04 01   ..... ..	PCI Endpoint Device
0000B0h   01 08 00 00 00 20 04 02   ..... ..	PCI Endpoint Device
0000B8h   01 08 00 00 00 20 04 03   ..... ..	PCI Endpoint Device
0000C0h   01 08 00 00 00 20 04 04   ..... ..	PCI Endpoint Device
0000C8h   01 08 00 00 00 20 04 05   ..... ..	PCI Endpoint Device
0000D0h   01 08 00 00 00 20 04 06   ..... ..	PCI Endpoint Device
0000D8h   01 08 00 00 00 20 04 07   ..... ..	PCI Endpoint Device

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
0000E0h   00 00 28 00 01 00 00 00   ..(.....	structType: 0000 (DRHD), struc=
tLength: 0028 flags: 01
0000E8h   00 E0 FF F4 00 00 00 00   .=C3=A0=C3=BF=C3=B4....	base: F4FFE000 =
(dmar1)=20

0000F0h   03 08 00 00 08 00 1E 01   ........	IOAPIC
0000F8h   03 08 00 00 00 00 05 04   ........	IOAPIC
000100h   04 08 00 00 00 00 1F 00   ........	MSI_CAPABLE_HPET



--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8189ed45-40e0-46d7-ae43-8139953068d0%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1695_1592432265.1557744867980
Content-Type: text/x-python; charset=US-ASCII; name=sysfs_parser.py
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=sysfs_parser.py
X-Attachment-Id: f16f193d-a2c1-4b65-902d-d63f77bb8b22
Content-ID: <f16f193d-a2c1-4b65-902d-d63f77bb8b22>

#
# Jailhouse, a Linux-based partitioning hypervisor
#
# Copyright (c) Siemens AG, 2014-2017
# Copyright (c) Valentine Sinitsyn, 2014-2015
#
# Authors:
#  Henning Schild <henning.schild@siemens.com>
#  Jan Kiszka <jan.kiszka@siemens.com>
#  Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
#
# This work is licensed under the terms of the GNU GPL, version 2.  See
# the COPYING file in the top-level directory.
#
# This script should help to create a basic jailhouse configuration file.
# It needs to be executed on the target machine, where it will gather
# information about the system. For more advanced scenarios you will have
# to change the generated C-code.


import struct
import os
import fnmatch

from .pci_defs import PCI_CAP_ID, PCI_EXT_CAP_ID

root_dir = "/"


def set_root_dir(dir):
    global root_dir
    root_dir = dir

inputs = {
    'files': set(),
    'files_opt': set(),
    'files_intel': set(),
    'files_amd': set()
}

# required files
inputs['files'].add('/proc/iomem')
inputs['files'].add('/proc/cpuinfo')
inputs['files'].add('/proc/cmdline')
inputs['files'].add('/proc/ioports')
inputs['files'].add('/sys/bus/pci/devices/*/config')
inputs['files'].add('/sys/bus/pci/devices/*/resource')
inputs['files'].add('/sys/devices/system/cpu/cpu*/uevent')
inputs['files'].add('/sys/firmware/acpi/tables/APIC')
inputs['files'].add('/sys/firmware/acpi/tables/MCFG')
# optional files
inputs['files_opt'].add('/sys/class/dmi/id/product_name')
inputs['files_opt'].add('/sys/class/dmi/id/sys_vendor')
inputs['files_opt'].add('/sys/class/tty/*/iomem_base')
inputs['files_opt'].add('/sys/class/tty/*/iomem_reg_shift')
inputs['files_opt'].add('/sys/class/tty/*/io_type')
inputs['files_opt'].add('/sys/class/tty/*/port')
inputs['files_opt'].add('/sys/devices/jailhouse/enabled')
# platform specific files
inputs['files_intel'].add('/sys/firmware/acpi/tables/DMAR')
inputs['files_amd'].add('/sys/firmware/acpi/tables/IVRS')


def check_input_listed(name, optional=False):
    set = inputs['files_opt']
    if optional is False:
        set = inputs['files']
        cpuvendor = get_cpu_vendor()
        if cpuvendor == 'GenuineIntel':
            set = set.union(inputs['files_intel'])
        elif cpuvendor == 'AuthenticAMD':
            set = set.union(inputs['files_amd'])

    for file in set:
        if fnmatch.fnmatch(name, file):
            return True
    raise RuntimeError('"' + name + '" is not a listed input file')


def input_open(name, mode='r', optional=False):
    check_input_listed(name, optional)
    try:
        f = open(root_dir + name, mode)
    except Exception as e:
        if optional:
            return open("/dev/null", mode)
        raise e
    return f


def input_listdir(dir, wildcards):
    for w in wildcards:
        check_input_listed(os.path.join(dir, w))
    dirs = os.listdir(root_dir + dir)
    dirs.sort()
    return dirs


def parse_iomem(pcidevices):
    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(
        IOMemRegionTree.parse_iomem_file())

    rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
    add_rom_region = False

    ret = []
    for r in regions:
        append_r = True
        # filter the list for MSI-X pages
        for d in pcidevices:
            if d.msix_address >= r.start and d.msix_address <= r.stop:
                if d.msix_address > r.start:
                    head_r = MemRegion(r.start, d.msix_address - 1,
                                       r.typestr, r.comments)
                    ret.append(head_r)
                if d.msix_address + d.msix_region_size < r.stop:
                    tail_r = MemRegion(d.msix_address + d.msix_region_size,
                                       r.stop, r.typestr, r.comments)
                    ret.append(tail_r)
                append_r = False
                break
        # filter out the ROMs
        if (r.start >= rom_region.start and r.stop <= rom_region.stop):
            add_rom_region = True
            append_r = False
        # filter out and save DMAR regions
        if r.typestr.find('dmar') >= 0:
            dmar_regions.append(r)
            append_r = False
        if append_r:
            ret.append(r)

    # add a region that covers all potential ROMs
    if add_rom_region:
        ret.append(rom_region)

    # newer Linux kernels will report the first page as reserved
    # it is needed for CPU init so include it anyways
    if (ret[0].typestr == 'System RAM' and ret[0].start == 0x1000):
        ret[0].start = 0

    return ret, dmar_regions


def parse_pcidevices():
    int_src_cnt = 0
    devices = []
    caps = []
    basedir = '/sys/bus/pci/devices'
    list = input_listdir(basedir, ['*/config'])
    for dir in list:
        d = PCIDevice.parse_pcidevice_sysfsdir(basedir, dir)
        if d is not None:
            if len(d.caps) > 0:
                duplicate = False
                # look for duplicate capability patterns
                for d2 in devices:
                    if d2.caps == d.caps:
                        # reused existing capability list, but record all users
                        d2.caps[0].comments.append(str(d))
                        d.caps_start = d2.caps_start
                        duplicate = True
                        break
                if not duplicate:
                    d.caps[0].comments.append(str(d))
                    d.caps_start = len(caps)
                    caps.extend(d.caps)
            int_src_cnt += max(d.num_msi_vectors, d.num_msix_vectors)
            devices.append(d)
    return (devices, caps, int_src_cnt)


def parse_madt():
    f = input_open('/sys/firmware/acpi/tables/APIC', 'rb')
    signature = f.read(4)
    if signature != b'APIC':
        raise RuntimeError('MADT: incorrect input file format %s' % signature)
    (length,) = struct.unpack('<I', f.read(4))
    f.seek(44)
    length -= 44
    ioapics = []

    while length > 0:
        offset = 0
        (struct_type, struct_len) = struct.unpack('<BB', f.read(2))
        offset += 2
        length -= struct_len

        if struct_type == 1:
            (id, address, gsi_base) = struct.unpack('<BxII', f.read(10))
            offset += 10
            ioapics.append(IOAPIC(id, address, gsi_base))

        f.seek(struct_len - offset, os.SEEK_CUR)

    f.close()
    return ioapics


def assign_iommu_info(flags, pcidevices, units, ioapics, scope_type, id, bus, dev, fn):
    # PCI Endpoint Device
    if scope_type == 1:
        assert not (flags & 1)
        for d in pcidevices:
            if d.bus == bus and d.dev == dev and d.fn == fn:
                d.iommu = len(units) - 1
                break
    # PCI Sub-hierarchy
    elif scope_type == 2:
        assert not (flags & 1)
        for d in pcidevices:
            if d.bus == bus and d.dev == dev and d.fn == fn:
                (secondbus, subordinate) = \
                    PCIPCIBridge.get_2nd_busses(d)
                for d2 in pcidevices:
                    if (
                        d2.bus >= secondbus and
                        d2.bus <= subordinate
                    ):
                        d2.iommu = len(units) - 1
                break
    # IOAPIC
    elif scope_type == 3:
        ioapic = next(chip for chip in ioapics if chip.id == id)
        bdf = (bus << 8) | (dev << 3) | fn
        for chip in ioapics:
            if chip.bdf == bdf:
                raise RuntimeError('IOAPICs with identical BDF')
        ioapic.bdf = bdf
        ioapic.iommu = len(units) - 1


def append_comment_info(comments, scope_type, bus, dev, fn):
    if scope_type == 1:
        comments.append('PCI device: %02x:%02x.%x' %
                        (bus, dev, fn))
    else:
        comments.append('DMAR parser could not decode device path')


# parsing of DMAR ACPI Table
# see Intel VT-d Spec chapter 8
def parse_dmar(pcidevices, ioapics, dmar_regions):
    f = input_open('/sys/firmware/acpi/tables/DMAR', 'rb')
    signature = f.read(4)
    if signature != b'DMAR':
        raise RuntimeError('DMAR: incorrect input file format %s' % signature)
    (length,) = struct.unpack('<I', f.read(4))
    f.seek(48)
    length -= 48
    units = []
    regions = []

    while length > 0:
        offset = 0
        (struct_type, struct_len) = struct.unpack('<HH', f.read(4))
        offset += 4
        length -= struct_len

        # DMA Remapping Hardware Unit Definition
        if struct_type == 0:
            (flags, segment, base) = struct.unpack('<BxHQ', f.read(12))
            if segment != 0:
                raise RuntimeError('We do not support multiple PCI segments')
            if len(units) >= 8:
                raise RuntimeError('Too many DMAR units. '
                                   'Raise JAILHOUSE_MAX_IOMMU_UNITS.')
            size = 0
            for r in dmar_regions:
                if base == r.start:
                    size = r.size()
            if size == 0:
                raise RuntimeError('DMAR region size cannot be identified.\n'
                                   'Target Linux must run with Intel IOMMU '
                                   'enabled.')
            if size > 0x3000:
                raise RuntimeError('Unexpectedly large DMAR region.')
            units.append(IOMMUConfig({
                'base_addr': base,
                'mmio_size': size
            }))
            if flags & 1:
                for d in pcidevices:
                    if d.iommu is None:
                        d.iommu = len(units) - 1
            offset += 16 - offset
            while offset < struct_len:
                (scope_type, scope_len) = struct.unpack('<BB', f.read(2))

                N = (int)((scope_len - 6) / 2) - 1

                (id, starting_bus, starting_dev, starting_fn) = struct.unpack(
                                                        '<xxBBBB', f.read(6))

                assign_iommu_info(flags, pcidevices, units, ioapics, \
                    scope_type, id, starting_bus, starting_dev, starting_fn)

                while N != 0:
                    N -= 1
                    (secondary_dev, secondary_fn) = \
                                    struct.unpack('<BB', f.read(2))
                    for d in pcidevices:
                        if d.bus == starting_bus and d.dev == starting_dev \
                                                 and d.fn == starting_fn:
                            (secondbus, subordinate) = \
                                PCIPCIBridge.get_2nd_busses(d)
                            break
                    assign_iommu_info(flags, pcidevices, units, ioapics, \
                        scope_type, id, secondbus, secondary_dev, \
                        secondary_fn)
                offset += scope_len

        # Reserved Memory Region Reporting Structure
        if struct_type == 1:
            f.seek(8 - offset, os.SEEK_CUR)
            offset += 8 - offset
            (base, limit) = struct.unpack('<QQ', f.read(16))
            offset += 16

            comments = []
            while offset < struct_len:
                (scope_type, scope_len) = struct.unpack('<BB', f.read(2))

                N = (int)((scope_len - 6) / 2) - 1

                (id, starting_bus, starting_dev, starting_fn) = struct.unpack(
                                                    '<xxBBBB', f.read(6))

                append_comment_info(comments, scope_type, starting_bus, \
                                                starting_dev, starting_fn)

                while N != 0:
                    N -= 1
                    (secondary_dev, secondary_fn) = struct.unpack(
                                                    '<BB', f.read(2))
                    for d in pcidevices:
                        if d.bus == starting_bus and d.dev == starting_dev \
                                                 and d.fn == starting_fn:
                            (secondbus, subordinate) = \
                                    PCIPCIBridge.get_2nd_busses(d)
                            break

                    append_comment_info(comments, scope_type, secondbus, \
                                                secondary_dev, secondary_fn)
                offset += scope_len

            reg = MemRegion(base, limit, 'ACPI DMAR RMRR', comments)
            regions.append(reg)

        f.seek(struct_len - offset, os.SEEK_CUR)

    f.close()

    for d in pcidevices:
        if d.iommu is None:
            raise RuntimeError(
                'PCI device %02x:%02x.%x outside the scope of an '
                'IOMMU' % (d.bus, d.dev, d.fn))

    return units, regions


def parse_ivrs(pcidevices, ioapics):
    def format_bdf(bdf):
        bus, dev, fun = (bdf >> 8) & 0xff, (bdf >> 3) & 0x1f, bdf & 0x7
        return '%02x:%02x.%x' % (bus, dev, fun)

    f = input_open('/sys/firmware/acpi/tables/IVRS', 'rb')
    signature = f.read(4)
    if signature != b'IVRS':
        raise RuntimeError('IVRS: incorrect input file format %s' % signature)

    (length, revision) = struct.unpack('<IB', f.read(5))
    if revision > 2:
        raise RuntimeError('IVRS: unsupported Revision %02x' % revision)

    f.seek(48, os.SEEK_SET)
    length -= 48

    units = []
    regions = []
    # BDF of devices that are permitted outside IOMMU: root complex
    iommu_skiplist = set([0x0])
    ivhd_blocks = 0
    while length > 0:
        (block_type, block_length) = struct.unpack('<BxH', f.read(4))
        if block_type in [0x10, 0x11]:
            ivhd_blocks += 1
            if ivhd_blocks > 1:
                raise RuntimeError('Jailhouse doesn\'t support more than one '
                                   'AMD IOMMU per PCI function.')
            # IVHD block
            ivhd_fields = struct.unpack('<HHQHxxL', f.read(20))
            (iommu_bdf, base_cap_ofs,
             base_addr, pci_seg, iommu_feat) = ivhd_fields

            length -= block_length
            block_length -= 24

            if pci_seg != 0:
                raise RuntimeError('We do not support multiple PCI segments')

            if len(units) > 8:
                raise RuntimeError('Too many IOMMU units. '
                                   'Raise JAILHOUSE_MAX_IOMMU_UNITS.')

            msi_cap_ofs = None

            for i, d in enumerate(pcidevices):
                if d.bdf() == iommu_bdf:
                    # Extract MSI capability offset
                    for c in d.caps:
                        if c.id == PCI_CAP_ID.MSI:
                            msi_cap_ofs = c.start
                    # We must not map IOMMU to the cells
                    del pcidevices[i]

            if msi_cap_ofs is None:
                raise RuntimeError('AMD IOMMU lacks MSI support, and '
                                   'Jailhouse doesn\'t support MSI-X yet.')

            if (iommu_feat & (0xF << 13)) and (iommu_feat & (0x3F << 17)):
                # Performance Counters are supported, allocate 512K
                mmio_size = 524288
            else:
                # Allocate 16K
                mmio_size = 16384

            units.append(IOMMUConfig({
                'base_addr': base_addr,
                'mmio_size': mmio_size,
                'amd_bdf': iommu_bdf,
                'amd_base_cap': base_cap_ofs,
                'amd_msi_cap': msi_cap_ofs,
                # IVHD block type 0x11 has exact EFR copy but type 0x10 may
                # overwrite what hardware reports. Set reserved bit 0 in that
                # case to indicate that the value is in use.
                'amd_features': (iommu_feat | 0x1) if block_type == 0x10 else 0
            }))

            bdf_start_range = None
            while block_length > 0:
                (entry_type, device_id) = struct.unpack('<BHx', f.read(4))
                block_length -= 4

                if entry_type == 0x01:
                    # All
                    for d in pcidevices:
                        d.iommu = len(units) - 1
                elif entry_type == 0x02:
                    # Select
                    for d in pcidevices:
                        if d.bdf() == device_id:
                            d.iommu = len(units) - 1
                elif entry_type == 0x03:
                    # Start of range
                    bdf_start_range = device_id
                elif entry_type == 0x04:
                    # End of range
                    if bdf_start_range is None:
                        continue
                    for d in pcidevices:
                        if d.bdf() >= bdf_start_range and d.bdf() <= device_id:
                            d.iommu = len(units) - 1
                    bdf_start_range = None
                elif entry_type == 0x42:
                    # Alias select
                    (device_id_b,) = struct.unpack('<xHx', f.read(4))
                    block_length -= 4
                    for d in pcidevices:
                        if d.bdf() == device_id_b:
                            d.iommu = len(units) - 1
                elif entry_type == 0x43:
                    # Alias start of range
                    (device_id_b,) = struct.unpack('<xHx', f.read(4))
                    block_length -= 4
                    bdf_start_range = device_id_b
                elif entry_type == 0x48:
                    # Special device
                    (handle, device_id_b, variety) = struct.unpack(
                        '<BHB', f.read(4))
                    block_length -= 4
                    if variety == 0x01:  # IOAPIC
                        for chip in ioapics:
                            if chip.id == handle:
                                chip.bdf = device_id_b
                                chip.iommu = len(units) - 1
                else:
                    # Reserved or ignored entries
                    if entry_type >= 0x40:
                        f.seek(4, os.SEEK_CUR)
                        block_length -= 4

        elif type in [0x20, 0x21, 0x22]:
            # IVMD block
            ivmd_fields = struct.unpack('<BBHHHxxxxxxxxQQ', f.read(32))
            (block_type, block_flags, block_length,
             device_id, aux_data, mem_addr, mem_len) = ivmd_fields
            length -= block_length

            if int(block_flags):
                bdf_str = format_bdf(device_id)
                print(
                    'WARNING: Jailhouse doesn\'t support configurable '
                    '(eg. read-only) device memory. Device %s may not '
                    'work properly, especially in non-root cell.' % bdf_str)

            if block_type == 0x20:
                # All devices
                comment = None
            elif block_type == 0x21:
                # Selected device
                comment = 'PCI Device: %s' % format_bdf(device_id)
            elif block_type == 0x22:
                # Device range
                comment = 'PCI Device: %s - %s' % (
                    format_bdf(device_id), format_bdf(aux_data))

            if comment:
                print('WARNING: Jailhouse doesn\'t support per-device memory '
                      'regions. The memory at 0x%x will be mapped accessible '
                      'to all devices.' % mem_addr)

            regions.append(MemRegion(mem_addr, mem_len, 'ACPI IVRS', comment))
        elif type == 0x40:
            raise RuntimeError(
                'You board uses IVRS Rev. 2 feature Jailhouse doesn\'t '
                'support yet. Please report this to '
                'jailhouse-dev@googlegroups.com.')
        else:
            print(
                'WARNING: Skipping unknown IVRS '
                'block type 0x%02x' % block_type)

        for d in pcidevices:
            if d.bdf() not in iommu_skiplist and d.iommu is None:
                raise RuntimeError(
                    'PCI device %02x:%02x.%x outside the scope of an '
                    'IOMMU' % (d.bus, d.dev, d.fn))

        f.close()
        return units, regions


def get_cpu_vendor():
    with open(root_dir + '/proc/cpuinfo') as f:
        for line in f:
            if not line.strip():
                continue
            key, value = line.split(':')
            if key.strip() == 'vendor_id':
                return value.strip()


class PCIBARs:
    IORESOURCE_IO = 0x00000100
    IORESOURCE_MEM = 0x00000200
    IORESOURCE_MEM_64 = 0x00100000

    def __init__(self, dir):
        self.mask = []
        f = input_open(os.path.join(dir, 'resource'), 'r')
        n = 0
        while (n < 6):
            (start, end, flags) = f.readline().split()
            n += 1
            flags = int(flags, 16)
            if flags & PCIBARs.IORESOURCE_IO:
                mask = ~(int(end, 16) - int(start, 16))
            elif flags & PCIBARs.IORESOURCE_MEM:
                if flags & PCIBARs.IORESOURCE_MEM_64:
                    mask = int(end, 16) - int(start, 16)
                    (start, end, flags) = f.readline().split()
                    mask |= (int(end, 16) - int(start, 16)) << 32
                    mask = ~(mask)
                    self.mask.append(mask & 0xffffffff)
                    mask >>= 32
                    n += 1
                else:
                    mask = ~(int(end, 16) - int(start, 16))
            else:
                mask = 0
            self.mask.append(mask & 0xffffffff)
        f.close()


class PCICapability:
    def __init__(self, id, extended, start, len, flags, content, msix_address):
        self.id = id
        self.extended = extended
        self.start = start
        self.len = len
        self.flags = flags
        self.content = content
        self.msix_address = msix_address
        self.comments = []

    def __eq__(self, other):
        return self.id == other.id and self.start == other.start and \
            self.len == other.len and self.flags == other.flags

    def gen_id_str(self):
        return str(self.id) + \
            (' | JAILHOUSE_PCI_EXT_CAP' if self.extended else '')

    RD = '0'
    RW = 'JAILHOUSE_PCICAPS_WRITE'

    JAILHOUSE_PCI_EXT_CAP = 0x8000

    @staticmethod
    def parse_pcicaps(dir):
        caps = []
        has_extended_caps = False
        f = input_open(os.path.join(dir, 'config'), 'rb')
        f.seek(0x06)
        (status,) = struct.unpack('<H', f.read(2))
        # capability list supported?
        if (status & (1 << 4)) == 0:
            f.close()
            return caps
        # walk capability list
        f.seek(0x34)
        (next,) = struct.unpack('B', f.read(1))
        while next != 0:
            cap = next
            msix_address = 0
            f.seek(cap)
            (id, next) = struct.unpack('<BB', f.read(2))
            id = PCI_CAP_ID(id)
            if id == PCI_CAP_ID.PM:
                # this cap can be handed out completely
                len = 8
                flags = PCICapability.RW
            elif id == PCI_CAP_ID.MSI:
                # access will be moderated by hypervisor
                len = 10
                (msgctl,) = struct.unpack('<H', f.read(2))
                if (msgctl & (1 << 7)) != 0:  # 64-bit support
                    len += 4
                if (msgctl & (1 << 8)) != 0:  # per-vector masking support
                    len += 10
                flags = PCICapability.RW
            elif id == PCI_CAP_ID.EXP:
                len = 20
                (cap_reg,) = struct.unpack('<H', f.read(2))
                if (cap_reg & 0xf) >= 2:  # v2 capability
                    len = 60
                # access side effects still need to be analyzed
                flags = PCICapability.RD
                has_extended_caps = True
            elif id == PCI_CAP_ID.MSIX:
                # access will be moderated by hypervisor
                len = 12
                (table,) = struct.unpack('<xxI', f.read(6))
                f.seek(0x10 + (table & 7) * 4)
                (bar,) = struct.unpack('<I', f.read(4))
                if (bar & 0x3) != 0:
                    raise RuntimeError('Invalid MSI-X BAR found')
                if (bar & 0x4) != 0:
                    bar |= struct.unpack('<I', f.read(4))[0] << 32
                msix_address = \
                    (bar & 0xfffffffffffffff0) + (table & 0xfffffff8)
                flags = PCICapability.RW
            else:
                # unknown/unhandled cap, mark its existence
                len = 2
                flags = PCICapability.RD
            f.seek(cap + 2)
            content = f.read(len - 2)
            caps.append(PCICapability(id, False, cap, len, flags, content,
                                      msix_address))

        if has_extended_caps:
            # walk extended capability list
            next = 0x100
            while next != 0:
                cap = next
                f.seek(cap)
                (id, version_next) = struct.unpack('<HH', f.read(4))
                if id == 0xffff:
                    break
                elif (id & PCICapability.JAILHOUSE_PCI_EXT_CAP) != 0:
                    print('WARNING: Ignoring unsupported PCI Express '
                          'Extended Capability ID %x' % id)
                    continue

                id = PCI_EXT_CAP_ID(id)
                next = version_next >> 4
                if id == PCI_EXT_CAP_ID.SRIOV:
                    len = 64
                    # access side effects still need to be analyzed
                    flags = PCICapability.RD
                else:
                    # unknown/unhandled cap, mark its existence
                    len = 4
                    flags = PCICapability.RD
                f.seek(cap + 4)
                content = f.read(len - 4)
                caps.append(PCICapability(id, True, cap, len, flags, content,
                                          0))

        f.close()
        return caps


class PCIDevice:
    def __init__(self, type, domain, bus, dev, fn, bars, caps, path):
        self.type = type
        self.iommu = None
        self.domain = domain
        self.bus = bus
        self.dev = dev
        self.fn = fn
        self.bars = bars
        self.caps = caps
        self.path = path
        self.caps_start = 0
        self.num_caps = len(caps)
        self.num_msi_vectors = 0
        self.msi_64bits = 0
        self.num_msix_vectors = 0
        self.msix_region_size = 0
        self.msix_address = 0
        for c in caps:
            if c.id in (PCI_CAP_ID.MSI, PCI_CAP_ID.MSIX):
                msg_ctrl = struct.unpack('<H', c.content[:2])[0]
                if c.id == PCI_CAP_ID.MSI:
                    self.num_msi_vectors = 1 << ((msg_ctrl >> 1) & 0x7)
                    self.msi_64bits = (msg_ctrl >> 7) & 1
                else:  # MSI-X
                    if c.msix_address != 0:
                        vectors = (msg_ctrl & 0x7ff) + 1
                        self.num_msix_vectors = vectors
                        self.msix_region_size = (vectors * 16 + 0xfff) & 0xf000
                        self.msix_address = c.msix_address
                    else:
                        print('WARNING: Ignoring invalid MSI-X configuration'
                              ' of device %02x:%02x.%x' % (bus, dev, fn))

    def __str__(self):
        return 'PCIDevice: %02x:%02x.%x' % (self.bus, self.dev, self.fn)

    def bdf(self):
        return self.bus << 8 | self.dev << 3 | self.fn

    @staticmethod
    def parse_pcidevice_sysfsdir(basedir, dir):
        dpath = os.path.join(basedir, dir)
        f = input_open(os.path.join(dpath, 'config'), 'rb')
        (vendor_device,) = struct.unpack('<I', f.read(4))
        if vendor_device == 0xffffffff:
            print('WARNING: Ignoring apparently disabled PCI device %s' % dir)
            return None
        f.seek(0x0A)
        (classcode,) = struct.unpack('<H', f.read(2))
        f.close()
        if classcode == 0x0604:
            type = 'JAILHOUSE_PCI_TYPE_BRIDGE'
        else:
            type = 'JAILHOUSE_PCI_TYPE_DEVICE'
        a = dir.split(':')
        domain = int(a[0], 16)
        bus = int(a[1], 16)
        df = a[2].split('.')
        bars = PCIBARs(dpath)
        caps = PCICapability.parse_pcicaps(dpath)
        return PCIDevice(type, domain, bus, int(df[0], 16), int(df[1], 16),
                         bars, caps, dpath)


class PCIPCIBridge(PCIDevice):
    @staticmethod
    def get_2nd_busses(dev):
        assert dev.type == 'JAILHOUSE_PCI_TYPE_BRIDGE'
        f = input_open(os.path.join(dev.path, 'config'), 'rb')
        f.seek(0x19)
        (secondbus, subordinate) = struct.unpack('<BB', f.read(2))
        f.close()
        return (secondbus, subordinate)


class MemRegion:
    def __init__(self, start, stop, typestr, comments=None):
        self.start = start
        self.stop = stop
        self.typestr = typestr
        self.comments = comments or []

    def __str__(self):
        return 'MemRegion: %08x-%08x : %s' % \
            (self.start, self.stop, self.typestr)

    def size(self):
        # round up to full PAGE_SIZE
        return int((self.stop - self.start + 0xfff) / 0x1000) * 0x1000

    def flagstr(self, p=''):
        if (
            self.typestr == 'System RAM' or
            self.typestr == 'Kernel' or
            self.typestr == 'RAM buffer' or
            self.typestr == 'ACPI DMAR RMRR' or
            self.typestr == 'ACPI IVRS'
        ):
            s = 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |\n'
            s += p + '\t\tJAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA'
            return s
        return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'


class IOAPIC:
    def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
        self.id = id
        self.address = address
        self.gsi_base = gsi_base
        self.iommu = iommu
        self.bdf = bdf

    def __str__(self):
        return 'IOAPIC %d, GSI base %d' % (self.id, self.gsi_base)

    def irqchip_id(self):
        # encode the IOMMU number into the irqchip ID
        return (self.iommu << 16) | self.bdf


class IOMemRegionTree:
    def __init__(self, region, level):
        self.region = region
        self.level = level
        self.parent = None
        self.children = []

    def __str__(self):
        s = ''
        if (self.region):
            s = (' ' * (self.level - 1)) + str(self.region)
            if self.parent and self.parent.region:
                s += ' --> ' + self.parent.region.typestr
            s += '\n'
        for c in self.children:
            s += str(c)
        return s

    def regions_split_by_kernel(self):
        kernel = [x for x in self.children if
                  x.region.typestr.startswith('Kernel ')]

        if (len(kernel) == 0):
            return [self.region]

        r = self.region
        s = r.typestr

        kernel_start = kernel[0].region.start
        kernel_stop = kernel[len(kernel) - 1].region.stop

        # align this for 16M, but only if we have enough space
        kernel_stop = (kernel_stop & ~0xFFFFFF) + 0xFFFFFF
        if (kernel_stop > r.stop):
            kernel_stop = r.stop

        before_kernel = None
        after_kernel = None

        # before Kernel if any
        if (r.start < kernel_start):
            before_kernel = MemRegion(r.start, kernel_start - 1, s)

        kernel_region = MemRegion(kernel_start, kernel_stop, "Kernel")

        # after Kernel if any
        if (r.stop > kernel_stop):
            after_kernel = MemRegion(kernel_stop + 1, r.stop, s)

        return [before_kernel, kernel_region, after_kernel]

    @staticmethod
    def parse_iomem_line(line):
        a = line.split(':', 1)
        level = int(a[0].count(' ') / 2) + 1
        region = a[0].split('-', 1)
        a[1] = a[1].strip()
        return level, MemRegion(int(region[0], 16), int(region[1], 16), a[1])

    @staticmethod
    def parse_iomem_file():
        root = IOMemRegionTree(None, 0)
        f = input_open('/proc/iomem')
        lastlevel = 0
        lastnode = root
        for line in f:
            (level, r) = IOMemRegionTree.parse_iomem_line(line)
            t = IOMemRegionTree(r, level)
            if (t.level > lastlevel):
                t.parent = lastnode
            if (t.level == lastlevel):
                t.parent = lastnode.parent
            if (t.level < lastlevel):
                p = lastnode.parent
                while(t.level < p.level):
                    p = p.parent
                t.parent = p.parent

            t.parent.children.append(t)
            lastnode = t
            lastlevel = t.level
        f.close()

        return root

    # find specific regions in tree
    @staticmethod
    def find_regions_by_name(tree, name):
        regions = []

        for tree in tree.children:
            r = tree.region
            s = r.typestr

            if (s.find(name) >= 0):
                regions.append(r)

            # if the tree continues recurse further down ...
            if (len(tree.children) > 0):
                regions.extend(
                    IOMemRegionTree.find_regions_by_name(tree, name))

        return regions

    # recurse down the tree
    @staticmethod
    def parse_iomem_tree(tree):
        regions = []
        dmar_regions = []

        for tree in tree.children:
            r = tree.region
            s = r.typestr

            # System RAM on the first level will be added completely,
            # if they don't contain the kernel itself, if they do,
            # we split them
            if (tree.level == 1 and s == 'System RAM'):
                regions.extend(tree.regions_split_by_kernel())
                continue

            # blacklisted on all levels
            if (
                (s.find('PCI MMCONFIG') >= 0) or
                (s.find('APIC') >= 0)  # covers both APIC and IOAPIC
            ):
                continue

            # generally blacklisted, with a few exceptions
            if (s.lower() == 'reserved'):
                regions.extend(
                    IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
                dmar_regions.extend(
                    IOMemRegionTree.find_regions_by_name(tree, 'dmar'))
                continue

            # if the tree continues recurse further down ...
            if (len(tree.children) > 0):
                (temp_regions, temp_dmar_regions) = \
                    IOMemRegionTree.parse_iomem_tree(tree)
                regions.extend(temp_regions)
                dmar_regions.extend(temp_dmar_regions)
                continue

            # add all remaining leaves
            regions.append(r)

        return regions, dmar_regions


class IOMMUConfig:
    def __init__(self, props):
        self.base_addr = props['base_addr']
        self.mmio_size = props['mmio_size']
        if 'amd_bdf' in props:
            self.amd_bdf = props['amd_bdf']
            self.amd_base_cap = props['amd_base_cap']
            self.amd_msi_cap = props['amd_msi_cap']
            self.amd_features = props['amd_features']

    @property
    def is_amd_iommu(self):
        return hasattr(self, 'amd_bdf')

------=_Part_1695_1592432265.1557744867980
Content-Type: text/plain; charset=UTF-8; name=Parsed_DMAR.txt
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=Parsed_DMAR.txt
X-Attachment-Id: dd932b4e-955e-4908-8694-e78f955a5bc9
Content-ID: <dd932b4e-955e-4908-8694-e78f955a5bc9>


fbefe000-fbefefff : dmar0
f4ffe000-f4ffefff : dmar1


(DRHD).flags

Bit 0: INCLUDE_PCI_ALL
=E2=80=A2 If Clear, this remapping hardware unit has under its scope only
devices in the specified Segment that are explicitly identified through
the =E2=80=98Device Scope=E2=80=99 field.


=E2=80=A2 If Set, this remapping hardware unit has under its scope all PCI
compatible devices in the specified Segment, except devices reported
under the scope of other remapping hardware units for the same
Segment.=20

If a DRHD structure with INCLUDE_PCI_ALL flag Set is
reported for a Segment, it must be enumerated by BIOS after all
other DRHD structures for the same Segment 1 .=20

A DRHD structure with
INCLUDE_PCI_ALL flag Set may use the =E2=80=98Device Scope=E2=80=99 field t=
o
enumerate I/OxAPIC and HPET devices under its scope.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


000000h   44 4D 41 52 44 04 00 00   DMARD...=09length:00000444
000008h   01 69 48 50 20 20 20 20   .iHP   =20
000010h   50 72 6F 4C 69 61 6E 74   ProLiant
000018h   01 00 00 00 D2 04 00 00   ....=C3=92...
000020h   2E 16 00 00 2D 03 00 00   ....-...
000028h   00 00 00 00 00 00 00 00   ........

000030h   00 00 B0 00 00 00 00 00   ..=C2=B0.....=09structType: 0000 (DRHD)=
, structLength: 00B0 flags: 00
000038h   00 E0 EF FB 00 00 00 00   .=C3=A0=C3=AF=C3=BB....=09base: FBEFE00=
0=09(dmar0)

000040h   02 08 00 00 00 20 00 00   ..... ..=09PCI Sub-hierarchy
000048h   02 08 00 00 00 20 01 00   ..... ..=09PCI Sub-hierarchy
000050h   02 08 00 00 00 20 01 01   ..... ..=09PCI Sub-hierarchy
000058h   02 08 00 00 00 20 02 00   ..... ..=09PCI Sub-hierarchy
000060h   02 08 00 00 00 20 02 01   ..... ..=09PCI Sub-hierarchy
000068h   02 08 00 00 00 20 02 02   ..... ..=09PCI Sub-hierarchy
000070h   02 08 00 00 00 20 02 03   ..... ..=09PCI Sub-hierarchy
000078h   02 08 00 00 00 20 03 00   ..... ..=09PCI Sub-hierarchy
000080h   02 08 00 00 00 20 03 01   ..... ..=09PCI Sub-hierarchy
000088h   02 08 00 00 00 20 03 02   ..... ..=09PCI Sub-hierarchy
000090h   02 08 00 00 00 20 03 03   ..... ..=09PCI Sub-hierarchy
000098h   03 08 00 00 0A 20 05 04   ..... ..=09IOAPIC
0000A0h   01 08 00 00 00 20 04 00   ..... ..=09PCI Endpoint Device
0000A8h   01 08 00 00 00 20 04 01   ..... ..=09PCI Endpoint Device
0000B0h   01 08 00 00 00 20 04 02   ..... ..=09PCI Endpoint Device
0000B8h   01 08 00 00 00 20 04 03   ..... ..=09PCI Endpoint Device
0000C0h   01 08 00 00 00 20 04 04   ..... ..=09PCI Endpoint Device
0000C8h   01 08 00 00 00 20 04 05   ..... ..=09PCI Endpoint Device
0000D0h   01 08 00 00 00 20 04 06   ..... ..=09PCI Endpoint Device
0000D8h   01 08 00 00 00 20 04 07   ..... ..=09PCI Endpoint Device

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
0000E0h   00 00 28 00 01 00 00 00   ..(.....=09structType: 0000 (DRHD), str=
uctLength: 0028 flags: 01
0000E8h   00 E0 FF F4 00 00 00 00   .=C3=A0=C3=BF=C3=B4....=09base: F4FFE00=
0 (dmar1)=20

0000F0h   03 08 00 00 08 00 1E 01   ........=09IOAPIC
0000F8h   03 08 00 00 00 00 05 04   ........=09IOAPIC
000100h   04 08 00 00 00 00 1F 00   ........=09MSI_CAPABLE_HPET

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
000108h   01 00 28 00 00 00 00 00   ..(.....=09structType: 0001, structLeng=
th: 0028
000110h   00 D0 FF BD 00 00 00 00   .=C3=90=C3=BF=C2=BD....
000118h   FF FF FF BD 00 00 00 00   =C3=BF=C3=BF=C3=BF=C2=BD....

000120h   01 08 00 00 00 00 1D 00   ........=09PCI Endpoint Device
000128h   01 08 00 00 00 00 1A 00   ........=09PCI Endpoint Device

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
000130h   01 00 36 00 00 00 00 00   ..6.....=09structType: 0001, structLeng=
th: 0036
000138h   00 60 FF BD 00 00 00 00   .`=C3=BF=C2=BD....
000140h   FF CF FF BD 00 00 00 00   =C3=BF=C3=8F=C3=BF=C2=BD....

=0901 0A 00 00 00 00 1C 07 00 00   ........=09PCI Endpoint Device (size A)
=0901 0A 00 00 00 00 1C 07 00 02   ........=09PCI Endpoint Device (size A)
=0901 0A 00 00 00 00 1C 07 00 04   ........=09PCI Endpoint Device (size A)
=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=09=09=09    01 00   ........=09structType: 0001, structLength: 006E=09=09=
=09=09
000168h   6E 00 00 00 00 00 00 30   n......0
000170h   F8 BD 00 00 00 00 FF 4F   =C3=B8=C2=BD....=C3=BFO
000178h   F8 BD 00 00 00 00=20

=0901 0A 00 00 00 00 02 02 00 00   =0900:02.02 and [02]----00.0  Hewlett-Pa=
ckard Company Smart Array Gen8 Controllers
=0901 0A 00 00 00 00 1C 07 00 00 =09=0900:1C.07 and [01]--+-00.0
=0901 0A 00 00 00 00 1C 07 00 02 =09=0900:1C.07 and [01]--+-00.2
=0901 08 00 00 00 00 1F 02 =09=0900:1F.02
=0901 08 00 00 00 00 1F 05 =09=0900:1F.05
=0901 0A 00 00 00 00 02 00 00 00  =09=0900:02.00 and [03]--+-00.0  Broadcom=
 Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe
=0901 0A 00 00 00 00 02 00 00 01  =09=0900:02.00 and [03]--+-00.1  Broadcom=
 Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe  =20
=0901 0A 00 00 00 00 02 00 00 02  =09=0900:02.00 and [03]--+-00.2  Broadcom=
 Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe
=0901 0A 00 00 00 00 02 00 00 03  =09=0900:02.00 and [03]--+-00.3  Broadcom=
 Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=09=09      01 00 6E 00   ......n.=09structType: 0001, structLength: 006E
0001D8h   00 00 00 00 00 F0 F7 BD   .....=C3=B0=C3=B7=C2=BD
0001E0h   00 00 00 00 FF 2F F8 BD   ....=C3=BF/=C3=B8=C2=BD
0001E8h   00 00 00 00=20

=0901 0A 00 00 00 00 02 02 00 00   =0900:02.02 and [02]----00.0  =20
=0901 0A 00 00 00 00 1C 07 00 00 =09=0900:1C.07 and [01]--+-00.0 =20
=0901 0A 00 00 00 00 1C 07 00 02 =09=0900:1C.07 and [01]--+-00.2=20
=0901 08 00 00 00 00 1F 02 =09=0900:1F.02
=0901 08 00 00 00 00 1F 05 =09=0900:1F.05
=0901 0A 00 00 00 00 02 00 00 00=20
=0901 0A 00 00 00 00 02 00 00 01=20
=0901 0A 00 00 00 00 02 00 00 02  =20
=0901 0A 00 00 00 00 02 00 00 03
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=09=0901 00 6E 00 00 00   ....n...=09structType: 0001, structLength: 006E
000248h   00 00 00 F0 F6 BD 00 00   ...=C3=B0=C3=B6=C2=BD..
000250h   00 00 FF EF F7 BD 00 00   ..=C3=BF=C3=AF=C3=B7=C2=BD..
000258h   00 00=20

=0901 0A 00 00 00 00 02 02 00 00=20
=0901 0A 00 00 00 00 1C 07 00 00=20
=0901 0A 00 00 00 00 1C 07 00 02  =20
=0901 08 00 00 00 00 1F 02  =20
 =0901 08 0 00 00 00 1F 05  =20
 =0901 0A 00 00 00 00 02 00 00 00=20
=0901 0A 00 00 00 00 02 00 00 01=20
=0901 0A 00 00 00 00 02 00 00 02=20
=0901 0A 00 00 00 00 02 00 00 03  =20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
0002B0h   01 00 6E 00 00 00 00 00   ..n.....=09structType: 0001, structLeng=
th: 006E
0002B8h   00 40 0F 00 00 00 00 00   .@......
0002C0h   FF 4F 0F 00 00 00 00 00   =C3=BFO......

=0901 0A 00 00 00 00 02 02 00 00=20
=0901 0A 00 00 00 00 1C 07 00 00
=0901 0A 00 00 00 00 1C 07 00 02
=0901 08 00 00 00 00 1F 02=20
=0901 08 00 00 00 00 1F 05=20
=0901 0A 00 00 00 00 02 00 00 00  =20
  =0901 0A 00 00 00 00 02 00 00 01=20
=0901 0A 00 00 00 00 02 00 00 02=20
=0901 0A 00 00 00 00 02 00 00 03=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=09=09=09    01 00   ........=09structType: 0001, structLength: 006E
000320h   6E 00 00 00 00 00 00 80   n.......
000328h   0E 00 00 00 00 00 FF 8F   ......=C3=BF.
000330h   0E 00 00 00 00 00=20

=0901 0A 00 00 00 00 02 02 00 00  =20
=0901 0A 00 00 00 00 1C 07 00 00=20
=0901 0A 00 00 00 00 1C 07 00 02=20
=0901 08 00 00 00 00 1F 02=20
=0901 08 00 00 00 00 1F 05=20
=0901 0A 00 00 00 00 02 00 00 00=20
=0901 0A 00 00 00 00 02 00 00 01  =20
  =0901 0A 00 00 00 00 02 00 00 02=20
=0901 0A 00 00 00 00 02 00 00 03

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=09=09      02 00 60 00   ......`.=09structType: 0002, structLength: 0060
000390h   00 00 00 00 =09=09=09=09Root Port ATS Capability Reporting (ATSR)=
 Structure

=0902 08 00 00 00 20 00 00=20
=0902 08 00 00 00 20 01 00=20
=0902 08 00 00 00 20 01 01=20
=0902 08 00 00 00 20 02 00=20
=0902 08 00 00 00 20 02 01=20
=0902 08 00 00 00 20 02 02=20
=0902 08 00 00 00 20 02 03=20
=0902 08 00 00 00 20 03 00=20
=0902 08 00 00 00 20 03 01=20
=0902 08 00 00 00 20 03 02=20
=0902 08 00 00 00 20 03 03=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=09=09      02 00 58 00   . ....X.=09structType: 0002, structLength: 0058
0003F0h   00 00 00 00=09=09=09=09Root Port ATS Capability Reporting (ATSR) =
Structure

=0902 08 00 00 00 00 01 00=20
=0902 08 00 00 00 00 01 01=20
=0902 08 00 00 00 00 02 00=20
=0902 08 00 00 00 00 02 01
=0902 08 00 00 00 00 02 02
=0902 08 00 00 00 00 02 03=20
=0902 08 00 00 00 00 03 00
=0902 08 00 00 00 00 03 01
=0902 08 00 00 00 00 03 02=20
=0902 08 00 00 00 00 03 03=20

=09=09      D0            ....=C3=90


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D



000000h   44 4D 41 52 44 04 00 00   DMARD...=09length:00000444
000008h   01 69 48 50 20 20 20 20   .iHP   =20
000010h   50 72 6F 4C 69 61 6E 74   ProLiant
000018h   01 00 00 00 D2 04 00 00   ....=C3=92...
000020h   2E 16 00 00 2D 03 00 00   ....-...
000028h   00 00 00 00 00 00 00 00   ........

000030h   00 00 B0 00 00 00 00 00   ..=C2=B0.....=09structType: 0000 (DRHD)=
, structLength: 00B0 flags: 00
000038h   00 E0 EF FB 00 00 00 00   .=C3=A0=C3=AF=C3=BB....=09base: FBEFE00=
0=09(dmar0)  buna uygun dmar_regions bulunuyor. units lere ekleniyor..

000040h   02 08 00 00 00 20 00 00   ..... ..=09PCI Sub-hierarchy
000048h   02 08 00 00 00 20 01 00   ..... ..=09PCI Sub-hierarchy
000050h   02 08 00 00 00 20 01 01   ..... ..=09PCI Sub-hierarchy
000058h   02 08 00 00 00 20 02 00   ..... ..=09PCI Sub-hierarchy
000060h   02 08 00 00 00 20 02 01   ..... ..=09PCI Sub-hierarchy
000068h   02 08 00 00 00 20 02 02   ..... ..=09PCI Sub-hierarchy
000070h   02 08 00 00 00 20 02 03   ..... ..=09PCI Sub-hierarchy
000078h   02 08 00 00 00 20 03 00   ..... ..=09PCI Sub-hierarchy
000080h   02 08 00 00 00 20 03 01   ..... ..=09PCI Sub-hierarchy
000088h   02 08 00 00 00 20 03 02   ..... ..=09PCI Sub-hierarchy
000090h   02 08 00 00 00 20 03 03   ..... ..=09PCI Sub-hierarchy
000098h   03 08 00 00 0A 20 05 04   ..... ..=09IOAPIC
0000A0h   01 08 00 00 00 20 04 00   ..... ..=09PCI Endpoint Device
0000A8h   01 08 00 00 00 20 04 01   ..... ..=09PCI Endpoint Device
0000B0h   01 08 00 00 00 20 04 02   ..... ..=09PCI Endpoint Device
0000B8h   01 08 00 00 00 20 04 03   ..... ..=09PCI Endpoint Device
0000C0h   01 08 00 00 00 20 04 04   ..... ..=09PCI Endpoint Device
0000C8h   01 08 00 00 00 20 04 05   ..... ..=09PCI Endpoint Device
0000D0h   01 08 00 00 00 20 04 06   ..... ..=09PCI Endpoint Device
0000D8h   01 08 00 00 00 20 04 07   ..... ..=09PCI Endpoint Device


0000E0h   00 00 28 00 01 00 00 00   ..(.....=09structType: 0000 (DRHD), str=
uctLength: 0028 flags: 01
0000E8h   00 E0 FF F4 00 00 00 00   .=C3=A0=C3=BF=C3=B4....=09base: F4FFE00=
0 (dmar1)=20

0000F0h   03 08 00 00 08 00 1E 01   ........=09IOAPIC
0000F8h   03 08 00 00 00 00 05 04   ........=09IOAPIC
000100h   04 08 00 00 00 00 1F 00   ........=09MSI_CAPABLE_HPET


000108h   01 00 28 00 00 00 00 00   ..(.....=09structType: 0001, structLeng=
th: 0028
000110h   00 D0 FF BD 00 00 00 00   .=C3=90=C3=BF=C2=BD....
000118h   FF FF FF BD 00 00 00 00   =C3=BF=C3=BF=C3=BF=C2=BD....
000120h   01 08 00 00 00 00 1D 00   ........=09PCI Endpoint Device
000128h   01 08 00 00 00 00 1A 00   ........=09PCI Endpoint Device

000130h   01 00 36 00 00 00 00 00   ..6.....=09structType: 0001, structLeng=
th: 0036
000138h   00 60 FF BD 00 00 00 00   .`=C3=BF=C2=BD....
000140h   FF CF FF BD 00 00 00 00   =C3=BF=C3=8F=C3=BF=C2=BD....

000148h   01 0A 00 00 00 00 1C 07   ........=09PCI Endpoint Device (size A)
000150h   00 00 01 0A 00 00 00 00   ........=09PCI Endpoint Device (size A)
000158h   1C 07 00 02 01 0A 00 00   ........=09PCI Endpoint Device (size A)
000160h   00 00 1C 07 00 04=20


=09=09=09    01 00   ........=09structType: 0001, structLength: 006E=09=09=
=09=09
000168h   6E 00 00 00 00 00 00 30   n......0
000170h   F8 BD 00 00 00 00 FF 4F   =C3=B8=C2=BD....=C3=BFO
000178h   F8 BD 00 00 00 00=20
=09=09=09    01 0A   =C3=B8=C2=BD......
000180h   00 00 00 00 02 02 00 00   ........
000188h   01 0A 00 00 00 00 1C 07   ........
000190h   00 00 01 0A 00 00 00 00   ........
000198h   1C 07 00 02 01 08 00 00   ........
0001A0h   00 00 1F 02 01 08 00 00   ........
0001A8h   00 00 1F 05 01 0A 00 00   ........
0001B0h   00 00 02 00 00 00 01 0A   ........
0001B8h   00 00 00 00 02 00 00 01   ........
0001C0h   01 0A 00 00 00 00 02 00   ........
0001C8h   00 02 01 0A 00 00 00 00   ........
0001D0h   02 00 00 03=20

=09=09      01 00 6E 00   ......n.=09structType: 0001, structLength: 006E
0001D8h   00 00 00 00 00 F0 F7 BD   .....=C3=B0=C3=B7=C2=BD
0001E0h   00 00 00 00 FF 2F F8 BD   ....=C3=BF/=C3=B8=C2=BD
0001E8h   00 00 00 00 01 0A 00 00   ........
0001F0h   00 00 02 02 00 00 01 0A   ........
0001F8h   00 00 00 00 1C 07 00 00   ........
000200h   01 0A 00 00 00 00 1C 07   ........
000208h   00 02 01 08 00 00 00 00   ........
000210h   1F 02 01 08 00 00 00 00   ........
000218h   1F 05 01 0A 00 00 00 00   ........
000220h   02 00 00 00 01 0A 00 00   ........
000228h   00 00 02 00 00 01 01 0A   ........
000230h   00 00 00 00 02 00 00 02   ........
000238h   01 0A 00 00 00 00 02 00   ........
000240h   00 03=20

=09=0901 00 6E 00 00 00   ....n...=09structType: 0001, structLength: 006E
000248h   00 00 00 F0 F6 BD 00 00   ...=C3=B0=C3=B6=C2=BD..
000250h   00 00 FF EF F7 BD 00 00   ..=C3=BF=C3=AF=C3=B7=C2=BD..
000258h   00 00 01 0A 00 00 00 00   ........
000260h   02 02 00 00 01 0A 00 00   ........
000268h   00 00 1C 07 00 00 01 0A   ........
000270h   00 00 00 00 1C 07 00 02   ........
000278h   01 08 00 00 00 00 1F 02   ........
000280h   01 08 00 00 00 00 1F 05   ........
000288h   01 0A 00 00 00 00 02 00   ........
000290h   00 00 01 0A 00 00 00 00   ........
000298h   02 00 00 01 01 0A 00 00   ........
0002A0h   00 00 02 00 00 02 01 0A   ........
0002A8h   00 00 00 00 02 00 00 03   ........


0002B0h   01 00 6E 00 00 00 00 00   ..n.....=09structType: 0001, structLeng=
th: 006E
0002B8h   00 40 0F 00 00 00 00 00   .@......
0002C0h   FF 4F 0F 00 00 00 00 00   =C3=BFO......
0002C8h   01 0A 00 00 00 00 02 02   ........
0002D0h   00 00 01 0A 00 00 00 00   ........
0002D8h   1C 07 00 00 01 0A 00 00   ........
0002E0h   00 00 1C 07 00 02 01 08   ........
0002E8h   00 00 00 00 1F 02 01 08   ........
0002F0h   00 00 00 00 1F 05 01 0A   ........
0002F8h   00 00 00 00 02 00 00 00   ........
000300h   01 0A 00 00 00 00 02 00   ........
000308h   00 01 01 0A 00 00 00 00   ........
000310h   02 00 00 02 01 0A 00 00   ........
000318h   00 00 02 00 00 03=20

=09=09=09    01 00   ........=09structType: 0001, structLength: 006E
000320h   6E 00 00 00 00 00 00 80   n.......
000328h   0E 00 00 00 00 00 FF 8F   ......=C3=BF.
000330h   0E 00 00 00 00 00 01 0A   ........
000338h   00 00 00 00 02 02 00 00   ........
000340h   01 0A 00 00 00 00 1C 07   ........
000348h   00 00 01 0A 00 00 00 00   ........
000350h   1C 07 00 02 01 08 00 00   ........
000358h   00 00 1F 02 01 08 00 00   ........
000360h   00 00 1F 05 01 0A 00 00   ........
000368h   00 00 02 00 00 00 01 0A   ........
000370h   00 00 00 00 02 00 00 01   ........
000378h   01 0A 00 00 00 00 02 00   ........
000380h   00 02 01 0A 00 00 00 00   ........
000388h   02 00 00 03=20

=09=09      02 00 60 00   ......`.=09structType: 0002, structLength: 0060
000390h   00 00 00 00 02 08 00 00   ........
000398h   00 20 00 00 02 08 00 00   . ......
0003A0h   00 20 01 00 02 08 00 00   . ......
0003A8h   00 20 01 01 02 08 00 00   . ......
0003B0h   00 20 02 00 02 08 00 00   . ......
0003B8h   00 20 02 01 02 08 00 00   . ......
0003C0h   00 20 02 02 02 08 00 00   . ......
0003C8h   00 20 02 03 02 08 00 00   . ......
0003D0h   00 20 03 00 02 08 00 00   . ......
0003D8h   00 20 03 01 02 08 00 00   . ......
0003E0h   00 20 03 02 02 08 00 00   . ......
0003E8h   00 20 03 03=20

=09=09      02 00 58 00   . ....X.=09structType: 0002, structLength: 0058
0003F0h   00 00 00 00 02 08 00 00   ........
0003F8h   00 00 01 00 02 08 00 00   ........
000400h   00 00 01 01 02 08 00 00   ........
000408h   00 00 02 00 02 08 00 00   ........
000410h   00 00 02 01 02 08 00 00   ........
000418h   00 00 02 02 02 08 00 00   ........
000420h   00 00 02 03 02 08 00 00   ........
000428h   00 00 03 00 02 08 00 00   ........
000430h   00 00 03 01 02 08 00 00   ........
000438h   00 00 03 02 02 08 00 00   ........
000440h   00 00 03 03=20

=09=09      D0            ....=C3=90


------=_Part_1695_1592432265.1557744867980--
